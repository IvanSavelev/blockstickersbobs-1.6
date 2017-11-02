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
    <h3><i class="icon-cogs"></i> {l s='Main menu' mod='blockstickersbobs'}</h3>

    <div class="row">
        <div class=" col-xs-12 col-sm-6">
            <h4 class="page-subheading">{l s='Categories' mod='blockstickersbobs'}</h4>

			<div class="tree_top">
				<a href="{$current_url|escape:'htmlall':'UTF-8'}&amp;
                id_category={$categoriesTree.id|escape:'quotes':'UTF-8'}&amp;open_category=1"
				   title="{$categoriesTree.name|escape:'html':'UTF-8'}"
						{if $id_category == $categoriesTree.id || $id_category == 2 || $id_category == 0} id="category_check" autofocus="autofocus" {/if}>{$categoriesTree.name|escape:'html':'UTF-8'}</a>
			</div>
			<ul class="tree">
				{if isset($categoriesTree.children)}
					{foreach $categoriesTree.children as $child}
						{if $child@last}
							{include file=$subcategory_dir node=$child last='true' id_category=$id_category}
						{else}
							{include file=$subcategory_dir node=$child id_category=$id_category}
						{/if}
					{/foreach}
				{/if}
			</ul>
        </div>

        <div class=" col-xs-12 col-sm-6">
            <div class="btn-group-action">
                <a href="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=stickers"
                   class="btn btn-default ">
                    <i class="process-icon-cogs"></i> {l s='Update/create stickers' mod='blockstickersbobs'}
                </a>
            </div>
        </div>
    </div>

    <br>
	<form method="post" action="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=empty" id="massive_form">
        <div class="row">
            <table class="table">
                <thead>


				<tr>

					<th class="fixed-width-xs center">
						<span class="title_box active">{l s='ID' mod='blockstickersbobs'}
							<a {if ($filter_name == 'id' && $filter_order == 'desc')}class="active"{/if} href="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=empty&amp;filter_name=id_product&amp;filter_order=desc">
								<i class="icon-caret-down"></i>
							</a>
							<a {if ($filter_name == 'id' && $filter_order == 'asc')}class="active"{/if} href="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=empty&amp;filter_name=id_product&amp;filter_order=asc">
								<i class="icon-caret-up"></i>
							</a>
						</span>
					</th>

					<th class="pointer center">
						<span class="title_box">{l s='Image' mod='blockstickersbobs'}</span>
					</th>

					<th class="">
						<span class="title_box center">{l s='Name' mod='blockstickersbobs'}
							<a {if ($filter_name == 'name' && $filter_order == 'desc')}class="active"{/if} href="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=empty&amp;filter_name=Name&amp;filter_order=desc">
								<i class="icon-caret-down"></i>
							</a>
							<a {if ($filter_name == 'name' && $filter_order == 'asc')}class="active"{/if} href="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=empty&amp;filter_name=Name&amp;filter_order=asc">
								<i class="icon-caret-up"></i>
							</a>
						</span>
					</th>

					<th class="">
						<span class="title_box center">{l s='Reference' mod='blockstickersbobs'}
							<a {if ($filter_name == 'reference' && $filter_order == 'desc')}class="active"{/if} href="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=empty&amp;filter_name=Reference&amp;filter_order=desc">
								<i class="icon-caret-down"></i>
							</a>
							<a {if ($filter_name == 'reference' && $filter_order == 'asc')}class="active"{/if} href="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=empty&amp;filter_name=Reference&amp;filter_order=asc">
								<i class="icon-caret-up"></i>
							</a>
						</span>
					</th>

					<th class="">
						<span class="title_box">{l s='Category' mod='blockstickersbobs'}
							<a {if ($filter_name == 'category' && $filter_order == 'desc')}class="active"{/if} href="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=empty&amp;filter_name=Category&amp;filter_order=desc">
								<i class="icon-caret-down"></i>
							</a>
							<a {if ($filter_name == 'category' && $filter_order == 'asc')}class="active"{/if} href="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=empty&amp;filter_name=Category&amp;filter_order=asc">
								<i class="icon-caret-up"></i>
							</a>
						</span>
					</th>


					<th class="fixed-width-sm text-center">
						<span class="title_box">{l s='Status' mod='blockstickersbobs'}</span>
					</th>

					<th class="pointer center">
						<span class="title_box">{l s='Image sticker' mod='blockstickersbobs'}</span>
					</th>

					<th>
					</th>

				</tr>


				<tr class="nodrag nodrop filter row_hover">

					<th class="center">
						<input type="text" class="filter" name="find_data[id_product]" pattern="^[\-0-9]+$"  value="{if isset($find_data['id'])}{$find_data['id']|escape:'html':'UTF-8'}{/if}">
					</th>

					<th class="center">
						--
					</th>

					<th>
						<input type="text" class="filter" name="find_data[name]" value="{if isset($find_data['name'])}{$find_data['name']|escape:'html':'UTF-8'}{/if}">
					</th>

					<th class="left">
						<input type="text" class="filter" name="find_data[reference]" value="{if isset($find_data['reference'])}{$find_data['reference']|escape:'html':'UTF-8'}{/if}">
					</th>

					<th class="text-right">
						<input type="text" class="filter" name="find_data[category_name]" value="{if isset($find_data['category_name'])}{$find_data['category_name']|escape:'html':'UTF-8'}{/if}">
					</th>

					<th class="text-center">
						<select class="filter fixed-width-sm center" name="find_data[active]">
							<option value="">-</option>
							<option value="1" {if isset($find_data['active']) && ($find_data['active'] === 1)}selected{/if}>{l s='Yes' mod='blockstickersbobs'}</option>
							<option value="0" {if isset($find_data['active']) && ($find_data['active'] === 0)}selected{/if}>{l s='No' mod='blockstickersbobs'}</option>
						</select>
					</th>

					<th class="center">
						--
					</th>

					<th class="actions">
						<span class="pull-right">
						<button type="submit" name="submitFilterblockstickersbobs" class="btn btn-default">
							<i class="icon-search"></i> {l s='Find' mod='blockstickersbobs'}
						</button>
						{if isset($find_data) && !$find_data|@count == 0}
							<button type="submit" name="submitResetProductblockstickersbobs" class="btn btn-warning">
								<i class="icon-eraser"></i>{l s='Reset' mod='blockstickersbobs'}
							</button>
						{/if}
						</span>
					</th>
				</tr>


                </thead>

				{if $products|count > 0}
                <tbody>
                {foreach from=$products key=k item=product}
                    <tr class="{if $k is even} odd{/if}">

						<td class="fixed-width-xs center">{$product['id_product']|escape:'html':'UTF-8'}</td>

						<td class="pointer center"><img class="imgm img-thumbnail"
												src="{$product.image_dir|escape:'htmlall':'UTF-8'}" alt="no image"
												width="70px">
						</td>

						<td class="left">{$product['name']|escape:'html':'UTF-8'}</td>

						<td class="left">{$product['reference']|escape:'html':'UTF-8'}</td>

                        <td class="center">{$product['category_name']|escape:'html':'UTF-8'}</td>

						<td class="pointer fixed-width-sm text-center">
							<div class="list-action-enable action-enabled {if $product['active']==0} hidden {/if}"
								 title="{l s='Active' mod='blockstickersbobs'}">
								<i class="icon-check"></i>
							</div>
							<div class="list-action-enable action-disabled {if $product['active']==1} hidden {/if}"
								 title="{l s='No active' mod='blockstickersbobs'}">
								<i class="icon-remove "></i>
							</div>
						</td>

                        <td class="pointer ">
                            <div class="sir_block_sticker">
                                {foreach $product['stickers'] as $id_sticker}
                                        {$sticker=$stickers_view_parameters[$id_sticker]}
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


                                {/foreach}
                            </div>
                        </td>

                        <td class="text-right">
                            <div class="btn-group-action">
                                <a href="{$current_url|escape:'htmlall':'UTF-8'}&amp;id_product={(int)$product['id_product']|escape:'quotes':'UTF-8'}&amp;redirect=openproduct"
                                   class="btn btn-default">
                                    <i class="icon-pencil"></i> {l s='Edit' mod='blockstickersbobs'}
                                </a>
                            </div>
                        </td>

                    </tr>
                {/foreach}
                </tbody>
				{else}

				<tbody>
				<tr>
					<td class="list-empty" colspan="12">
						<div class="list-empty-msg">
							<i class="icon-warning-sign list-empty-icon"></i>
							{l s='No products to display' mod='masschange'}
						</div>
					</td>
				</tr>
				</tbody>

				{/if}

            </table>
            <div class="clearfix">&nbsp;</div>
        </div>

	</form>

</div>




