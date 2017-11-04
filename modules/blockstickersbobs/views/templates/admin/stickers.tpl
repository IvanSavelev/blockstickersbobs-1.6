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
<form action="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=stickers" method="post" class="form-horizontal clearfix">
    <div class="panel col-lg-12">
        <div class="panel-heading">
            {l s='Quantity' mod='blockstickersbobs'}
            <span class="badge">{$stickers|count}</span>
			<span class="panel-heading-action">
				<a class="list-toolbar-btn" href="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=sticker">
					<span title="" data-toggle="tooltip" class="label-tooltip"
						  data-original-title="{l s='Add new' mod='blockstickersbobs'}"
						  data-html="true" data-placement="left">
							<i class="process-icon-new"></i>
					</span>
				</a>
				<a class="list-toolbar-btn" href="javascript:location.reload();">
					<span title="" data-toggle="tooltip" class="label-tooltip"
						  data-original-title="{l s='Refresh list' mod='blockstickersbobs'}"
						  data-html="true" data-placement="left">
						<i class="process-icon-refresh"></i>
					</span>
				</a>
			</span>
        </div>
        <div class="table-responsive clearfix">
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
							<span class="title_box">{l s='Status' mod='blockstickersbobs'}</span>
						</th>

						<th></th>

					</tr>
                </thead>

                <tbody>
                {foreach from=$stickers key=k item=sticker}
                <tr class="{if $k is even} odd{/if}">
                    <td class="text-center">
                        <input type="checkbox" name="delete_stickers[]"
                               value="{$sticker.id_sticker|escape:'quotes':'UTF-8'}"
                               class="noborder">
                    </td>

                    <td class="left">
					</td>

                    <td class="center">
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

					<td class="left">
						{$sticker.name|escape:'quotes':'UTF-8'}
					</td>

					<td class="left">
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

					<td class="text-right">
						<div class="btn-group-action">
							<div class="btn-group pull-right">
								<a href="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=sticker&amp;id_sticker={$sticker.id_sticker|escape:'quotes':'UTF-8'}"
								   title="{l s='Edit' mod='blockstickersbobs'}"
								   class="edit btn btn-default">
									<i class="icon-pencil"></i> {l s='Edit' mod='blockstickersbobs'}
								</a>
								<button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									<i class="icon-caret-down"></i>&nbsp;
								</button>
								<ul class="dropdown-menu">
									<li>
										<a href="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect=stickers&amp;delete_sticker={$sticker.id_sticker|escape:'quotes':'UTF-8'}"
										   onclick="if (confirm('{l s='Delete sticker?' mod='blockstickersbobs'}'))
												   {ldelim}return true;{rdelim}else{ldelim}event.stopPropagation(); event.preventDefault();{rdelim};"
										   title="Delete" class="delete">
											<i class="icon-trash"></i> {l s='Delete' mod='blockstickersbobs'}
										</a>
									</li>
								</ul>
							</div>
						</div>
					</td>
				</tr>

			{/foreach}
        </tbody>

        </table>
    </div>
    <div class="row">
        <div class="col-lg-6">
            <div class="btn-group bulk-actions">
                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    {l s='Bulk actions' mod='blockstickersbobs'}  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li>
                        <a href="#"
                           onclick="javascript:checkDelBoxes($(this).closest('form').get(0), 'delete_stickers[]', true);return false;">
                            <i class="icon-check-sign"></i> &nbsp;{l s='Select all' mod='blockstickersbobs'}
                        </a>
                    </li>
                    <li>
                        <a href="#"
                           onclick="javascript:checkDelBoxes($(this).closest('form').get(0), 'delete_stickers[]', false);return false;">
                            <i class="icon-check-empty"></i> &nbsp; {l s='Unselect all' mod='blockstickersbobs'}
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a href="#"
                           onclick="if (confirm('{l s='Delete selected stickers?' mod='blockstickersbobs'}'))sendBulkAction($(this).closest('form').get(0));">
                            &nbsp;{l s='Delete selected' mod='blockstickersbobs'}
                        </a>
                    </li>
                </ul>
            </div>
        </div>

    </div>
    </div>
</form>