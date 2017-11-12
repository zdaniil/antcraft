﻿<?php echo $header; ?><?php echo $column_left; ?>
<div id="content"><link type="text/css" href="view/stylesheet/stylesheet2.css" rel="stylesheet" media="screen" />
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      
      <table id="module" class="list">
        <thead>
          <tr>
            <td class="left">Feature</td>
            <td class="left">Enable</td>            			
          </tr>
        </thead>
        
        <tbody>
          <tr>
            <td class="left">Smart SEO Tags (eg. yoursite.com/<b>tags/apple</b>)</td>
           	<td class="left">
				<?php if (isset($extendedseo['seotags'])) { ?>
                <input type="checkbox" name="extendedseo[seotags]" value="1" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="extendedseo[seotags]" value="1" />
                <?php } ?></td>            
          </tr>
		  <tr>
            <td class="left">Product SEO Plus (adds a h2 tag with product's name at the beginning of product description)</a></td>
           	<td class="left">
				<?php if (isset($extendedseo['productseo'])) { ?>
                <input type="checkbox" name="extendedseo[productseo]" value="1" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="extendedseo[productseo]" value="1" />
                <?php } ?></td>            
          </tr>	 
		  <tr>
            <td class="left">Automatically add category names in product titles</a></td>
           	<td class="left">
				<?php if (isset($extendedseo['categoryintitle'])) { ?>
                <input type="checkbox" name="extendedseo[categoryintitle]" value="1" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="extendedseo[categoryintitle]" value="1" />
                <?php } ?></td>            
          </tr>	 
		  <tr>
            <td class="left">Transform store name in link to store</a></td>
           	<td class="left">
				<?php if (isset($extendedseo['link'])) { ?>
                <input type="checkbox" name="extendedseo[link]" value="1" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="extendedseo[link]" value="1" />
                <?php } ?></td>            
          </tr>	 
		   <tr>
            <td class="left">Use trailing Slashes for Categories and Brands SEO URLs (This slash is often used to differentiate between a directory and a file on the website.)</a></td>
           	<td class="left">
				<?php if (isset($extendedseo['slash'])) { ?>
                <input type="checkbox" name="extendedseo[slash]" value="1" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="extendedseo[slash]" value="1" />
                <?php } ?></td>            
          </tr>	 
		  <tr>
            <td class="left">Use Robots Tag - tells search engines crawlers to index your site's pages</a></td>
           	<td class="left">
				<?php if (isset($extendedseo['robots'])) { ?>
                <input type="checkbox" name="extendedseo[robots]" value="1" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="extendedseo[robots]" value="1" />
                <?php } ?></td>            
          </tr>	 
		  <tr>
            <td class="left">Smart trim all meta titles if they are longer than 60 characters </a></td>
           	<td class="left">
				<?php if (isset($extendedseo['trim_titles'])) { ?>
                <input type="checkbox" name="extendedseo[trim_titles]" value="1" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="extendedseo[trim_titles]" value="1" />
                <?php } ?></td>            
          </tr>	 
		  <tr>
            <td class="left">Smart trim all meta descriptions if they are longer than 160 characters </a></td>
           	<td class="left">
				<?php if (isset($extendedseo['trim_descriptions'])) { ?>
                <input type="checkbox" name="extendedseo[trim_descriptions]" value="1" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="extendedseo[trim_descriptions]" value="1" />
                <?php } ?></td>            
          </tr>	 
		  
        </tbody>
       
             
      </table>	  
    </form>
  </div>
</div>

<?php echo $footer; ?>