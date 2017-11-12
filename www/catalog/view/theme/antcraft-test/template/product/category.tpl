<?php echo $header; ?>
<div class="container">
    <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
    <div class="row"><?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-9'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-12'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
            <h1 class="product-title"><?php echo $heading_title; ?></h1>
            <?php
    function num2word($num, $words)
    {
        $num = $num % 100;
        if ($num > 19) {
            $num = $num % 10;
            }
            switch ($num) {
            case 1: {
            return($words[0]);
            }
            case 2: case 3: case 4: {
            return($words[1]);
            }
            default: {
            return($words[2]);
            }
            }
            }
            ?>

            <div class="product-quantity"><?php echo $product_total.' '.num2word($product_total, ['товар', 'товара', 'товаров']) ?></div>
<div class="row"></div>
            <div class="row" style="
    border: 1px solid;
    padding: 10px;
    font-weight: bold;
">

                <div class="col-md-5 text-right">
                    <label class="control-label" for="input-sort"><?php echo $text_sort; ?></label>
                </div>
                <div class="col-md-3 text-right input-sort">
                    <select id="input-sort" class="sort" onchange="location = this.value;">
                        <?php foreach ($sorts as $sorts) { ?>
                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                        <option value="<?php echo $sorts['href']; ?>"
                                selected="selected"><?php echo $sorts['text']; ?></option>
                        <?php } else { ?>
                        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                        <?php } ?>
                        <?php } ?>
                    </select>
                </div>
            </div>
            <br/>
            <div class="row">
                <?php foreach ($products as $product) { ?>
                <div class="col-sm-4 col-md-4 popular-box-catalog two ">
                    <div class="lable4"></div>
                    <div class="image">
                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"
                                                                       alt="<?php echo $product['name']; ?>"
                                                                       title="<?php echo $product['name']; ?>"
                                                                       class="img-responsive"/></a>
                    </div>

                    <p class="product-name short-title">
                        <?php echo $product['name']; ?>
                    </p>
                    <br>
                    <span class="product-price"><?php echo $product['price']; ?></span>
                    <a class="in-the-basket"
                       onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
                        <div class="basket-image"></div>
                        <span>в корзину</span></a>
                    <p class="old-product-price"></p>
                </div>
                <?php } ?>
            </div>
            <div class="row">
                <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
                <div class="col-sm-6 text-right"><?php echo $results; ?></div>
            </div>
            <?php if (!$categories && !$products) { ?>
            <p><?php echo $text_empty; ?></p>
            <div class="buttons">
                <div class="pull-right"><a href="<?php echo $continue; ?>"
                                           class="btn btn-primary"><?php echo $button_continue; ?></a></div>
            </div>
            <?php } ?>
            <?php echo $content_bottom; ?></div>
        <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
