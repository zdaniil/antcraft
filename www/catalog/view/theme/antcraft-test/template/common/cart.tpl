<div class="basket-right" >
    <h1>В корзине</h1>
    <div class="basket-right-close"><i style="font-size: 25px;" class="fa fa-times"></i></div>
    <div class="basket-line"></div>
    <div id="basket">
      <div id="cart" class="btn-group btn-block">
          <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-inverse btn-block btn-lg dropdown-toggle"><i class="fa fa-shopping-cart"></i> <span id="cart-total"><?php echo $text_items; ?></span></button>
          <ul class="dropdown-menu pull-right">
            <?php if ($products || $vouchers) { ?>
            <li>
              <table class="table">
                <?php foreach ($products as $product) { ?>
                <tr>
                  <td class="text-left"><?php if ($product['thumb']) { ?>
                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                    <?php } ?></td>
                  <td class="text-left">
                  <h3><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
                    <br>
                    <br>
                    <span class="basket-price"><?php echo $product['total']; ?></span>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <span class="vendor-code">Артикул: </span>
                  <br>
                  <br>

                  <span class="color">Цвет: </span>
                  <p class="quantity">
                      <?php echo $product['quantity']; ?>
                  </p>
                  </td>
                  <td class="text-center"><button type="button" onclick="cart.remove('<?php echo $product['key']; ?>');" title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i></button></td>
                </tr>
                <?php } ?>

              </table>
            </li>

            <?php } else { ?>
            <li>
              <p class="text-center"><?php echo $text_empty; ?></p>
            </li>
            <?php } ?>
          </ul>
        </div>
      </div>
      <a href="<?php echo $checkout; ?>"><div class="order-btn">оформить заказ</div></a>
    </div>
