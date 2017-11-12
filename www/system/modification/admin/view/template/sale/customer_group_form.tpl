<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-customer-group" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-customer-group" class="form-horizontal">
          <div class="form-group required">
            <label class="col-sm-2 control-label"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <?php foreach ($languages as $language) { ?>
              <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                <input type="text" name="customer_group_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($customer_group_description[$language['language_id']]) ? $customer_group_description[$language['language_id']]['name'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" class="form-control" />
              </div>
              <?php if (isset($error_name[$language['language_id']])) { ?>
              <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
              <?php } ?>
              <?php } ?>
            </div>
          </div>
          <?php foreach ($languages as $language) { ?>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
            <div class="col-sm-10">
              <div class="input-group"><span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                <textarea name="customer_group_description[<?php echo $language['language_id']; ?>][description]" rows="5" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($customer_group_description[$language['language_id']]) ? $customer_group_description[$language['language_id']]['description'] : ''; ?></textarea>
              </div>
            </div>
          </div>
          <?php } ?>
          <div class="form-group">
            <label class="col-sm-2 control-label"><span data-toggle="tooltip" title="<?php echo $help_approval; ?>"><?php echo $entry_approval; ?></span></label>
            <div class="col-sm-10">
              <label class="radio-inline">
                <?php if ($approval) { ?>
                <input type="radio" name="approval" value="1" checked="checked" />
                <?php echo $text_yes; ?>
                <?php } else { ?>
                <input type="radio" name="approval" value="1" />
                <?php echo $text_yes; ?>
                <?php } ?>
              </label>
              <label class="radio-inline">
                <?php if (!$approval) { ?>
                <input type="radio" name="approval" value="0" checked="checked" />
                <?php echo $text_no; ?>
                <?php } else { ?>
                <input type="radio" name="approval" value="0" />
                <?php echo $text_no; ?>
                <?php } ?>
              </label>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
              <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
            </div>
          </div>

		<div class="title" style="border-bottom:1px solid #DDD; padding:5px 0;margin:20px 0 10px 0; background-color:#FCFCFC;font-size: 14px;font-weight: 500;"><?php echo $entry_title; ?></div>
		<?php if (count($customer_groups)<=1 && $customer_group_id) { ?> 
			<p style="font-size:13px;"><?php echo $notify_one_group; ?></p>
		<?php } else { ?>
			<div style="border:1px solid #DDD; padding: 5px 10px; margin-top:5px;">
			<div class="form-group">
				<label class="col-sm-2 control-label" for="reach_customer_group_id"><?php echo $entry_reach_customer_group; ?></label>
                <div class="col-sm-10"><select name="reach_customer_group_id" id="reach_customer_group_id" class="form-control">
					<option value="0" selected="selected"><?php echo $text_no_group; ?></option>
                    <?php foreach ($customer_groups as $customer_group) { ?>
						<?php if ($customer_group['customer_group_id'] != $customer_group_id) { ?>
							<?php if ($customer_group['customer_group_id'] == $reach_customer_group_id) { ?>
							<option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo $customer_group['name']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></option>
						   <?php } ?>
						<?php } ?>
                   <?php } ?>
                 </select></div>
			</div>
			</div>
			<div style="border:1px solid #DDD; padding: 5px 10px; margin-top:5px;">
			<p style="font-size:13px;"><?php echo $text_conditions; ?></p>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="reach_value"><?php echo $entry_reach_value; ?></label>
				<div class="col-sm-10"><input type="text" name="reach_value" class="form-control" value="<?php echo $reach_value; ?>" id="reach_value"/></div>
			</div>
			<div class="form-group">			
				<label class="col-sm-2 control-label" for="reach_order_status_id"><?php echo $entry_reach_order_status; ?></label>
				<div class="col-sm-10"><select name="reach_order_status_id" id="reach_order_status_id" class="form-control">
                  <?php foreach ($order_statuss as $order_status) { ?>
                   <?php if ($order_status['order_status_id'] == $reach_order_status_id) { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
                   <?php } ?>
                  <?php } ?>
                </select></div>
			</div>
			</div>
			<div style="border:1px solid #DDD; padding: 5px 10px; margin-top:5px;">
			<p style="font-size:13px;"><?php echo $text_settings; ?></p>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="admin_notify"><span data-toggle="tooltip" title="<?php echo $help_admin_notify; ?>"><?php echo $entry_admin_notify; ?></span></label>
				<div class="col-sm-10"  style="padding-top:10px;"><?php if ($admin_notify) { ?>
                <input type="checkbox" name="admin_notify" value="1" checked="checked" id="admin_notify" />
                <?php } else { ?>
                <input type="checkbox" name="admin_notify" value="1" id="admin_notify" />
                <?php } ?></div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="customer_notify"><span data-toggle="tooltip" title="<?php echo $help_customer_notify; ?>"><?php echo $entry_customer_notify; ?></label>
				<div class="col-sm-10"  style="padding-top:10px;"><?php if ($customer_notify) { ?>
                <input type="checkbox" name="customer_notify" value="1" checked="checked" id="customer_notify" />
                <?php } else { ?>
                <input type="checkbox" name="customer_notify" value="1" id="customer_notify" />
                <?php } ?></div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label" for="s_status"><span data-toggle="tooltip" title="<?php echo $help_s_status; ?>"><?php echo $entry_s_status; ?></label>
				<div class="col-sm-10" style="padding-top:10px;"><?php if ($s_status) { ?>
                <input type="checkbox" name="s_status" value="1" checked="checked" id="s_status" />
                <?php } else { ?>
                <input type="checkbox" name="s_status" value="1" id="s_status" />
                <?php } ?></div>
            </div>
			</div>
        <?php } ?>   
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>