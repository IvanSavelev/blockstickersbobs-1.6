{*
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2017 PrestaShop SA
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{if isset($message)}{$message|escape:'quotes':'UTF-8'}{/if}
<div class="panel">
	<h3>
		<i class="icon-cogs"></i> {l s='Place the sticker on the product: '
		mod='blockstickersbobs'}<b>{$name_product|escape:'quotes':'UTF-8'}</b>
	</h3>

	<form action="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=entry" method="post" class="form-horizontal clearfix">

		<input type="hidden" name="id_product" value="{$id_product|escape:'quotes':'UTF-8'}"/>
		<input type="hidden" name="save_stickers_product" value="1"/>

		<div class="row">
			<!-- VIEWS -->
			<div class="col-lg-4">
				<div class=" sticker_radio">
        <span>
            {l s='View' mod='blockstickersbobs'}
        </span>
				</div>
				<div class=" col-lg-12">
					<div id="block_type_view_senior" class="block_type_view  center-block"
						 style="    position: relative; border:1px solid #aaaaaa;
								 width: {$width_box|escape:'quotes':'UTF-8'}px;
								 height: {$width_box|escape:'quotes':'UTF-8'}px; ">
						<img class="img_open_product"
							 src="{$path_image_product|escape:'htmlall':'UTF-8'}"
							 width="{($width_box -6)|escape:'quotes':'UTF-8'}">
						<!-- DEFAULT MODEL -->
						<div class="box_sticker hidden" id="box_sticker_default_0">
                            <span class="angle_right_sticker sub_div">
                            </span>
						</div>

						<div class="box_sticker box_sticker_left hidden" id="box_sticker_default_1">
                            <span class="angle_left_sticker sub_div">
                            </span>
						</div>

						<div class="box_sticker hidden" id="box_sticker_default_2">
							<div class="label_sticker sub_div">
							</div>
						</div>

						<div class="box_sticker hidden" id="box_sticker_default_3">
							<div class="horizontal_strip_sticker sub_div">
							</div>
						</div>

						<div class="box_sticker hidden" id="box_sticker_default_4">
							<img class="image_sticker sub_div">
						</div>


					</div>

				</div>
			</div>


			<div class="col-lg-8">
				<table class="table">
					<thead>
					<tr>
						<th class="center fixed-width-xs"></th>

						<th class=" left">
							<span class="title_box active">{l s='ID' mod='blockstickersbobs'}</span>
						</th>

						<th class="center ">
							<span class="title_box">{l s='Sticker image' mod='blockstickersbobs'}</span>
						</th>

						<th class=" left">
							<span class="title_box">{l s='Name sticker' mod='blockstickersbobs'}</span>
						</th>

						<th class=" left">
							<span class="title_box">{l s='On/Off' mod='blockstickersbobs'}</span>
						</th>

					</tr>
					</thead>
					<tbody>
					{foreach from=$stickers key=k item=sticker}
						<tr class="{if $k is even} odd{/if}">
							<td class="text-center">
								<input type="checkbox" name="checkbox_sticker[]"
									   value="{$sticker.id_sticker|escape:'quotes':'UTF-8'}"
									   class="noborder" {if $sticker.sticker_product_on}checked{/if}>
							</td>
							<td class="pointer left"
								onclick="document.location = '{$current_url|escape:'htmlall':'UTF-8'}&amp;previous=openproduct&amp;previous_id_product={$id_product|escape:'quotes':'UTF-8'}&amp;redirect=sticker&amp;id_sticker={$sticker.id_sticker|escape:'quotes':'UTF-8'}'"
								>
								{$sticker.id_sticker|escape:'quotes':'UTF-8'}
							</td>
							<td class="pointer center"
								onclick="document.location = '{$current_url|escape:'htmlall':'UTF-8'}&amp;previous=openproduct&amp;previous_id_product={$id_product|escape:'quotes':'UTF-8'}&amp;redirect=sticker&amp;id_sticker={$sticker.id_sticker|escape:'quotes':'UTF-8'}'"
								>
								{if $sticker.type_sticker==0}
									<div class="box_sticker_stickers">
										<span class="angle_right_sticker" style="
												color: {$sticker.color_font_sticker|escape:'quotes':'UTF-8'};
												background: {$sticker.color_background_sticker|escape:'quotes':'UTF-8'}
												">
												{$sticker.text_sticker|escape:'quotes':'UTF-8'}
										</span>
									</div>
								{elseif $sticker.type_sticker==1}
									<div class="box_sticker_stickers">
										<span class="angle_left_sticker" style="
												color: {$sticker.color_font_sticker|escape:'quotes':'UTF-8'};
												background: {$sticker.color_background_sticker|escape:'quotes':'UTF-8'}
												">
											{$sticker.text_sticker|escape:'quotes':'UTF-8'}
										</span>
									</div>
								{elseif $sticker.type_sticker==2}
									<div class="box_sticker_stickers any_width">
										<span class="label_sticker"
											  style="
													  color: {$sticker.color_font_sticker|escape:'quotes':'UTF-8'};
													  background: {$sticker.color_background_sticker|escape:'quotes':'UTF-8'}
													  ">
											{$sticker.text_sticker|escape:'quotes':'UTF-8'}
										</span>
									</div>
								{elseif $sticker.type_sticker==3}
									<div class="box_sticker_stickers any_width">
										<span class="horizontal_strip_sticker" style="
												color: {$sticker.color_font_sticker|escape:'quotes':'UTF-8'};
												background: {$sticker.color_background_sticker|escape:'quotes':'UTF-8'}
												">
											{$sticker.text_sticker|escape:'quotes':'UTF-8'}
										</span>
									</div>
								{elseif $sticker.type_sticker==4}
									<div class="box_sticker_stickers">
										<img class="image_sticker {if $sticker.type_sticker!=4}hidden {/if}"
											 src="{$sticker.current_url_img|escape:'htmlall':'UTF-8'}"
											 width="{$sticker.width_sticker|escape:'quotes':'UTF-8'}"
											 height="{$sticker.height_sticker|escape:'quotes':'UTF-8'}">
									</div>
								{/if}
							</td>
							<td class="pointer left"
								onclick="document.location = '{$current_url|escape:'htmlall':'UTF-8'}&amp;previous=openproduct&amp;previous_id_product={$id_product|escape:'quotes':'UTF-8'}&amp;redirect=sticker&amp;id_sticker={$sticker.id_sticker|escape:'quotes':'UTF-8'}'"
								>
								{$sticker.name|escape:'quotes':'UTF-8'}
							</td>
							<td class="pointer left"
								onclick="document.location = '{$current_url|escape:'htmlall':'UTF-8'}&amp;previous=openproduct&amp;previous_id_product={$id_product|escape:'quotes':'UTF-8'}&amp;redirect=sticker&amp;id_sticker={$sticker.id_sticker|escape:'quotes':'UTF-8'}'"
								>
								{if $sticker.activate==1}
									<span class="list-action-enable action-enabled"
										  title="{l s='Active' mod='blockstickersbobs'}">
										<i class="icon-check"></i>
									</span>
								{/if}
								{if $sticker.activate==0}
									<span class="list-action-enable action-disabled"
										  title="{l s='No active' mod='blockstickersbobs'}">
                                	<i class="icon-remove "></i>
                            		</span>
								{/if}
							</td>
						</tr>
					{/foreach}

					</tbody>

				</table>

			</div>
		</div>

		<div class="col-lg-12">
			<div class="panel-footer" id="toolbar-footer">
				<button type="submit" class="btn btn-default pull-right">
					<i class="process-icon-save"></i> <span>{l s='Save' mod='blockstickersbobs'}</span>
				</button>
				<a class="btn btn-default" href="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=entry">
					<i class="process-icon-cancel"></i> <span>{l s='Cancel' mod='blockstickersbobs'}</span>
				</a>
			</div>
		</div>

	</form>
</div>