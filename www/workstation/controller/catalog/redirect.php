<?php

/*******************************************************************************
*                                   Opencart Cache                             *
*                             Copyright : Ovidiu Fechete                       *
*                              email: ovife21@gmail.com                        *
*                Below source-code or any part of the source-code              *
*                          cannot be resold or distributed.                    *
*******************************************************************************/

class ControllerCatalogRedirect extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('catalog/redirect');

		$this->document->setTitle($this->language->get('heading_title'));
		
		
		$this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "autoredirect` (
						  `link` varchar(321) NOT NULL,
						  `fixedlink` varchar(321) NOT NULL,
						  `date` datetime NOT NULL						 
						) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;");
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('redirect', $this->request->post);
			$this->model_setting_setting->editSetting('redirect_settings', $this->request->post);			
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->response->redirect($this->url->link('catalog/redirect', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
				
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['button_clear_cache'] = $this->language->get('button_clear_cache');
		
		$data['text_no_results'] = $this->language->get('text_no_results');
		
		$data['button_remove'] = $this->language->get('button_remove');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];		
			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   			
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/redirect', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('catalog/redirect', 'token=' . $this->session->data['token'], 'SSL');
		$data['cancel'] = $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL');		
				
			
		
		$data['redirect'] = array();
		
		if (isset($this->request->post['redirect'])) {
			$data['redirect'] = $this->request->post['redirect'];
		} elseif ($this->config->get('redirect')) { 
			$data['redirect'] = $this->config->get('redirect');
		}
		
		$data['redirect_settings'] = array();
		
		if (isset($this->request->post['redirect_settings'])) {
			$data['redirect_settings'] = $this->request->post['redirect_settings'];
		} else {
			$data['redirect_settings'] = $this->config->get('redirect_settings');
		}
		
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		$url = '';
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
		
		$this->load->model('catalog/redirect');
		
		$fdata = array(			
			'start'           => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'           => $this->config->get('config_limit_admin')
		);
		
		$page_total = $this->model_catalog_redirect->getTotalPages();
			
		$results = $this->model_catalog_redirect->getPages($fdata);
						    	
		foreach ($results as $result) {
			
      		$data['pages'][] = array(
				'link' 				=> $result['link'],
				'fixedlink'         => $result['fixedlink'],			
				'date'    			=> $result['date']				
			);
    	}		
		
		$pagination = new Pagination();
		$pagination->total = $page_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/redirect', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
		$data['pagination'] = $pagination->render();
		
		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/redirect.tpl', $data));
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'catalog/redirect')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>