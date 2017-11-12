<div class="popular-cont">
    <h1>
        <?php echo $heading_title; ?>
    </h1>

    <ul class="popular-slider ">
        <?php foreach ($products as $product) { ?>
        <li class="popular-box one">
            <div class="image">
              <div class="lable3">хит</div>
              <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
            </div>

            <a href="#">
                <!--<div class="quick-view-btn">быстрый просмотр</div>-->
            </a>
            <p class="product-name short-title">
                <?php echo $product['name']; ?>
            </p>
            <br>
            <span class="product-price">
            <?php if ($product['price']) { ?>
            <?php echo $product['price']; ?>
            <?php } ?>
            </span>
            <a class="in-the-basket" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');"><i class="basket-image"></i><span> в корзину</span></a>
            <p class="old-product-price"></p>
        </li>
        <?php } ?>
    </ul>
</div>

<hr>
