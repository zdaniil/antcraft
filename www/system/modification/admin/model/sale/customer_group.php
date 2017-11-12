<?php
class ModelSaleCustomerGroup extends Model {
public function checkColumn() {
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_group");					
			if (!isset($query->row['reach_value'])) {
				$this->db->query("ALTER TABLE " . DB_PREFIX . "customer_group ADD `reach_value` DECIMAL(15,4) NOT NULL DEFAULT '0.0000'");
			}
			if (!isset($query->row['reach_customer_group_id'])) {
				$this->db->query("ALTER TABLE " . DB_PREFIX . "customer_group ADD `reach_customer_group_id` int(11) NOT NULL");
			}
			if (!isset($query->row['reach_order_status_id'])) {
				$this->db->query("ALTER TABLE " . DB_PREFIX . "customer_group ADD `reach_order_status_id` int(11) NOT NULL");
			}
			if (!isset($query->row['admin_notify'])) {
				$this->db->query("ALTER TABLE " . DB_PREFIX . "customer_group ADD `admin_notify` int(1) NOT NULL");
			}
			if (!isset($query->row['customer_notify'])) {
				$this->db->query("ALTER TABLE " . DB_PREFIX . "customer_group ADD `customer_notify` int(1) NOT NULL");
			}
			
			if (!isset($query->row['s_status'])) {
				$this->db->query("ALTER TABLE " . DB_PREFIX . "customer_group ADD `s_status` int(1) NOT NULL");
			}
			}
//for auto switch customer group
	public function getOrderStatus() {
		$query = $this->db->query("SELECT *  FROM " . DB_PREFIX . "order_status WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->rows;
	}
	public function getOrderStatusbyId($order_status_id) {
		$query = $this->db->query("SELECT name  FROM " . DB_PREFIX . "order_status WHERE order_status_id = '" . (int)$order_status_id . "' AND language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row['name'];
	}
	
	public function addCustomerGroup($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "customer_group SET approval = '" . (int)$data['approval'] . "', sort_order = '" . (int)$data['sort_order'] . "', reach_value = '" . (float)($data['reach_value']) . "', reach_customer_group_id = '" . (int)($data['reach_customer_group_id']) . "', reach_order_status_id = '" . (int)($data['reach_order_status_id']) . "', admin_notify = '" . (isset($data['admin_notify']) ? (int)$data['admin_notify'] : 0) . "', customer_notify = '" . (isset($data['customer_notify']) ? (int)$data['customer_notify'] : 0) . "', s_status = '" . (isset($data['s_status']) ? (int)$data['s_status'] : 0) . "'");

		$customer_group_id = $this->db->getLastId();

		foreach ($data['customer_group_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_group_description SET customer_group_id = '" . (int)$customer_group_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
	}

	public function editCustomerGroup($customer_group_id, $data) {
		$this->db->query("UPDATE " . DB_PREFIX . "customer_group SET approval = '" . (int)$data['approval'] . "', sort_order = '" . (int)$data['sort_order'] . "', reach_value = '" . (float)($data['reach_value']) . "', reach_customer_group_id = '" . (int)($data['reach_customer_group_id']) . "', reach_order_status_id = '" . (int)($data['reach_order_status_id']) . "', admin_notify = '" . (isset($data['admin_notify']) ? (int)$data['admin_notify'] : 0) . "', customer_notify = '" . (isset($data['customer_notify']) ? (int)$data['customer_notify'] : 0) . "', s_status = '" . (isset($data['s_status']) ? (int)$data['s_status'] : 0) . "' WHERE customer_group_id = '" . (int)$customer_group_id . "'");

		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_group_description WHERE customer_group_id = '" . (int)$customer_group_id . "'");

		foreach ($data['customer_group_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "customer_group_description SET customer_group_id = '" . (int)$customer_group_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
	}

	public function deleteCustomerGroup($customer_group_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_group WHERE customer_group_id = '" . (int)$customer_group_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "customer_group_description WHERE customer_group_id = '" . (int)$customer_group_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE customer_group_id = '" . (int)$customer_group_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE customer_group_id = '" . (int)$customer_group_id . "'");
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE customer_group_id = '" . (int)$customer_group_id . "'");
	}

	public function getCustomerGroup($customer_group_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "customer_group cg LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (cg.customer_group_id = cgd.customer_group_id) WHERE cg.customer_group_id = '" . (int)$customer_group_id . "' AND cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	public function getCustomerGroups($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "customer_group cg LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (cg.customer_group_id = cgd.customer_group_id) WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		$sort_data = array(
			'cgd.name',
			'cg.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY cgd.name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getCustomerGroupDescriptions($customer_group_id) {
		$customer_group_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "customer_group_description WHERE customer_group_id = '" . (int)$customer_group_id . "'");

		foreach ($query->rows as $result) {
			$customer_group_data[$result['language_id']] = array(
				'name'        => $result['name'],
				'description' => $result['description']
			);
		}

		return $customer_group_data;
	}

	public function getTotalCustomerGroups() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_group");

		return $query->row['total'];
	}
}