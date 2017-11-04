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

{if isset($stickers)}
    <div class="stickers_bobs">
        {foreach from=$stickers item=sticker}
            <div class="box_sticker dinamic_stickers_{$sticker.id_sticker|escape:'quotes':'UTF-8'}
				{if $sticker.type_sticker==1} box_sticker_left {/if}"
					style="
						{if $sticker.type_position_y=='T'}
							top: {$sticker.y_sticker|escape:'quotes':'UTF-8'}px;
						{else}
							bottom: {$sticker.y_sticker|escape:'quotes':'UTF-8'}px;
						{/if}

						{if $sticker.type_position_x=='L'}
							left:{$sticker.x_sticker|escape:'quotes':'UTF-8'}px;
						{else}
							right: {$sticker.x_sticker|escape:'quotes':'UTF-8'}px;
						{/if}

						{if $sticker.type_sticker==3}
							width:100%;
						{else}
							width:{$sticker.width_sticker|escape:'quotes':'UTF-8'}px;
						{/if}
							height:{$sticker.height_sticker|escape:'quotes':'UTF-8'}px;
					">

				{if $sticker.type_sticker==0}
					<span class="angle_right_sticker" style="
							color: {$sticker.color_font_sticker|escape:'quotes':'UTF-8'};
							font-size: {$sticker.size_font_sticker|escape:'quotes':'UTF-8'}px;
							background: {$sticker.color_background_sticker|escape:'quotes':'UTF-8'}
							">
								{$sticker.text_sticker|escape:'quotes':'UTF-8'}
					</span>
				{/if}

				{if $sticker.type_sticker==1}
					<span class="angle_left_sticker" style="
						color: {$sticker.color_font_sticker|escape:'quotes':'UTF-8'};
						font-size: {$sticker.size_font_sticker|escape:'quotes':'UTF-8'}px;
						background: {$sticker.color_background_sticker|escape:'quotes':'UTF-8'}
						">
							{$sticker.text_sticker|escape:'quotes':'UTF-8'}
					 </span>
				{/if}

				{if $sticker.type_sticker==2}
					<div class="label_sticker" style="
						 color: {$sticker.color_font_sticker|escape:'quotes':'UTF-8'};
						 font-size: {$sticker.size_font_sticker|escape:'quotes':'UTF-8'}px;
						 background: {$sticker.color_background_sticker|escape:'quotes':'UTF-8'}
						 ">
							{$sticker.text_sticker|escape:'quotes':'UTF-8'}
					</div>
				{/if}

				{if $sticker.type_sticker==3}
					<div class="horizontal_strip_sticker" style="
						color: {$sticker.color_font_sticker|escape:'quotes':'UTF-8'};
						font-size: {$sticker.size_font_sticker|escape:'quotes':'UTF-8'}px;
						background: {$sticker.color_background_sticker|escape:'quotes':'UTF-8'}
						">
							{$sticker.text_sticker|escape:'quotes':'UTF-8'}
					</div>
				{/if}

				{if $sticker.type_sticker==4}
					<img class="image_sticker " style="
						border-radius: 0px;
						background: none;
						width:{$sticker.width_sticker|escape:'quotes':'UTF-8'}px;
						height:{$sticker.height_sticker|escape:'quotes':'UTF-8'}px;
						"
						src="{$sticker.current_url_img|escape:'htmlall':'UTF-8'}"
						alt=""
						>
				{/if}
            </div>
        {/foreach}
    </div>
{/if}




