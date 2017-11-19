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
<h3><i class="icon-cogs"></i> {l s='Change sticker' mod='blockstickersbobs'}</h3>

<form action="{$current_url|escape:'htmlall':'UTF-8'}&amp;redirect={$redirect|escape:'html':'UTF-8'}" method="post" enctype="multipart/form-data"
	  class="form-horizontal">
<input type="hidden" name="save_sticker" value="1"/>
{if !$new_sticker}
	<input type="hidden" name="id_sticker" value="{$sticker->id_sticker|escape:'quotes':'UTF-8'}"/>
{/if}

<div class="form-group">
	<label class="control-label col-lg-3">{l s='Name sticker:' mod='blockstickersbobs'}</label>

	<div class="col-lg-6">
		<input type="text" name="name" maxlength="64"
			   value="{$sticker->name|escape:'quotes':'UTF-8'}"/>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-3">{l s='Title:' mod='blockstickersbobs'}</label>

	<div class="col-lg-6">
		<input type="text" name="title" maxlength="64" value="{$sticker->title|escape:'quotes':'UTF-8'}"/>

		<p class="help-block">{l s='The text appears when you put the mouse cursor on the label' mod='blockstickersbobs'}</p>
	</div>
</div>

<div class="form-group">
	<label class="control-label col-lg-3">{l s='Activate' mod='blockstickersbobs'}</label>

	<div class="col-lg-6">
                <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="activate" id="blockcontactinfos_on" value="1"
						   {if $sticker->activate==1}checked="checked"{/if}>
                    <label for="blockcontactinfos_on">{l s='Yes' mod='blockstickersbobs'}</label>
                    <input type="radio" name="activate" id="blockcontactinfos_off" value="0"
						   {if $sticker->activate==0}checked="checked"{/if}>
                    <label for="blockcontactinfos_off">{l s='No' mod='blockstickersbobs'}</label>
                    <a class="slide-button btn"></a>
                </span>
	</div>
</div>


<div class="form-group">
	<label class="control-label col-lg-3">{l s='Visible on the product tab' mod='blockstickersbobs'}</label>

	<div class="col-lg-6">
                <span class="switch prestashop-switch fixed-width-lg">
                    <input type="radio" name="visible_inside" id="visible_inside_on" value="1"
						   {if $sticker->visible_inside==1}checked="checked"{/if}>
                    <label for="visible_inside_on">{l s='Yes' mod='blockstickersbobs'}</label>
                    <input type="radio" name="visible_inside" id="visible_inside_off" value="0"
						   {if $sticker->visible_inside==0}checked="checked"{/if}>
                    <label for="visible_inside_off">{l s='No' mod='blockstickersbobs'}</label>
                    <a class="slide-button btn"></a>
                </span>

		<p class="help-block">{l s='The sticker is shown on the product tab' mod='blockstickersbobs'}</p>
	</div>
</div>


<!-- BLOCK TYPE STICKER-->
<div class="row row_sticker">
	<div class=" col-lg-4 ">
		<div class="radio sticker_radio">
			<label>
				<input type="radio" name="type_sticker" value="0"
					   {if $sticker->type_sticker==0}checked="checked"{/if}/>
				{l s='Angle right' mod='blockstickersbobs'}
			</label>
		</div>
		<div class=" col-lg-12">
			<div class="block_type_view  center-block"
				 style=" position: relative; border:1px solid #aaaaaa;
						 width: {$width_box|escape:'quotes':'UTF-8'}px;
						 height: {$width_box|escape:'quotes':'UTF-8'}px; ">
				<div class="box_sticker" style="
						right:{$sticker_default_angle_right.x_sticker|escape:'quotes':'UTF-8'}px;
						top: {$sticker_default_angle_right.y_sticker|escape:'quotes':'UTF-8'}px;
						width:{$sticker_default_angle_right.width_sticker|escape:'quotes':'UTF-8'}px;
						height:{$sticker_default_angle_right.height_sticker|escape:'quotes':'UTF-8'}px;
						">
                <span class="angle_right_sticker" style="
						color: {$sticker_default_angle_right.color_font_sticker|escape:'quotes':'UTF-8'};
						font-size: {$sticker_default_angle_right.size_font_sticker|escape:'quotes':'UTF-8'}px;
						background: {$sticker_default_angle_right.color_background_sticker|escape:'quotes':'UTF-8'}
						">
                    {$sticker_default_angle_right.text_sticker|escape:'quotes':'UTF-8'}</span>
				</div>
			</div>
		</div>
	</div>

	<div class=" col-lg-4 ">
		<div class="radio sticker_radio">
			<label>
				<input type="radio" name="type_sticker" value="1"
					   {if $sticker->type_sticker==1}checked="checked"{/if}/>
				{l s='Angle left' mod='blockstickersbobs'}
			</label>
		</div>
		<div class=" col-lg-12">
			<div class="block_type_view  center-block"
				 style=" position: relative; border:1px solid #aaaaaa;
						 width: {$width_box|escape:'quotes':'UTF-8'}px;
						 height: {$width_box|escape:'quotes':'UTF-8'}px; ">
				<div class="box_sticker box_sticker_left" style="
						left:{$sticker_default_angle_left.x_sticker|escape:'quotes':'UTF-8'}px;
						top: {$sticker_default_angle_left.y_sticker|escape:'quotes':'UTF-8'}px;
						width:{$sticker_default_angle_left.width_sticker|escape:'quotes':'UTF-8'}px;
						height:{$sticker_default_angle_left.height_sticker|escape:'quotes':'UTF-8'}px;
						">
                <span class="angle_left_sticker" style="
						color: {$sticker_default_angle_left.color_font_sticker|escape:'quotes':'UTF-8'};
						font-size: {$sticker_default_angle_left.size_font_sticker|escape:'quotes':'UTF-8'}px;
						background: {$sticker_default_angle_left.color_background_sticker|escape:'quotes':'UTF-8'}
						">
                    {$sticker_default_angle_left.text_sticker|escape:'quotes':'UTF-8'}</span>
				</div>
			</div>
		</div>
	</div>


	<div class=" col-lg-4 ">
		<div class="radio sticker_radio">
			<label>
				<input type="radio" name="type_sticker" value="2"
					   {if $sticker->type_sticker==2}checked="checked"{/if}/>
				{l s='Label' mod='blockstickersbobs'}
			</label>
		</div>
		<div class=" col-lg-12">
			<div class="block_type_view  center-block"
				 style=" position: relative; border:1px solid #aaaaaa;
						 width: {$width_box|escape:'quotes':'UTF-8'}px;
						 height: {$width_box|escape:'quotes':'UTF-8'}px; ">
				<div class="box_sticker" style="
						left:{$sticker_default_label.x_sticker|escape:'quotes':'UTF-8'}px;
						top: {$sticker_default_label.y_sticker|escape:'quotes':'UTF-8'}px;
						width:{$sticker_default_label.width_sticker|escape:'quotes':'UTF-8'}px;
						height:{$sticker_default_label.height_sticker|escape:'quotes':'UTF-8'}px;
						">
					<div class="label_sticker" style="
							color: {$sticker_default_label.color_font_sticker|escape:'quotes':'UTF-8'};
							font-size: {$sticker_default_label.size_font_sticker|escape:'quotes':'UTF-8'}px;
							background: {$sticker_default_label.color_background_sticker|escape:'quotes':'UTF-8'}
							">
						{$sticker_default_label.text_sticker|escape:'quotes':'UTF-8'}</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row row_sticker">
	<div class=" col-lg-4 ">
		<div class="radio sticker_radio">
			<label>
				<input type="radio" name="type_sticker" value="3"
					   {if $sticker->type_sticker==3}checked="checked"{/if}/>
				{l s='Horizontal strip' mod='blockstickersbobs'}
			</label>
		</div>
		<div class=" col-lg-12">
			<div class="block_type_view  center-block"
				 style=" position: relative; border:1px solid #aaaaaa;
						 width: {$width_box|escape:'quotes':'UTF-8'}px;
						 height: {$width_box|escape:'quotes':'UTF-8'}px; ">
				<div class="box_sticker" style="
						left:{$sticker_default_horizontal_strip.x_sticker|escape:'quotes':'UTF-8'}px;
						top: {$sticker_default_horizontal_strip.y_sticker|escape:'quotes':'UTF-8'}px;
						width:{$sticker_default_horizontal_strip.width_sticker|escape:'quotes':'UTF-8'}px;
						height:{$sticker_default_horizontal_strip.height_sticker|escape:'quotes':'UTF-8'}px;
						">
					<div class="horizontal_strip_sticker" style="
							color: {$sticker_default_horizontal_strip.color_font_sticker|escape:'quotes':'UTF-8'};
							font-size: {$sticker_default_horizontal_strip.size_font_sticker|escape:'quotes':'UTF-8'}px;
							background: {$sticker_default_horizontal_strip.color_background_sticker|escape:'quotes':'UTF-8'}
							">
						{$sticker_default_horizontal_strip.text_sticker|escape:'quotes':'UTF-8'}</span>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class=" col-lg-4 ">
		<div class="radio sticker_radio">
			<label>
				<input type="radio" name="type_sticker" value="4"
					   {if $sticker->type_sticker==4}checked="checked"{/if}/>
				{l s='Picture' mod='blockstickersbobs'}
			</label>
		</div>
		<div class=" col-lg-12">
			<div class="block_type_view  center-block"
				 style=" position: relative; border:1px solid #aaaaaa;
						 width: {$width_box|escape:'quotes':'UTF-8'}px;
						 height: {$width_box|escape:'quotes':'UTF-8'}px; ">
				<div class="box_sticker" style="
						left:{$sticker_default_image.x_sticker|escape:'quotes':'UTF-8'}px;
						top: {$sticker_default_image.y_sticker|escape:'quotes':'UTF-8'}px;
						width:{$sticker_default_image.width_sticker|escape:'quotes':'UTF-8'}px;
						height:{$sticker_default_image.height_sticker|escape:'quotes':'UTF-8'}px;
						">
					<img class="image_sticker"
						 src="{$current_url_default_img|escape:'htmlall':'UTF-8'}"
						 width="{$sticker_default_image.width_sticker|escape:'quotes':'UTF-8'}"
						 height="{$sticker_default_image.height_sticker|escape:'quotes':'UTF-8'}">
				</div>
			</div>
		</div>
	</div>

	<div class=" col-lg-4 ">
		<div class="radio sticker_radio">
			<label>
				<input type="radio" name="type_sticker" value="5"
					   {if $sticker->type_sticker==5}checked="checked"{/if}/>
				{l s='Label stylized' mod='blockstickersbobs'}
			</label>
		</div>
		<div class=" col-lg-12">
			<div class="block_type_view  center-block"
				 style=" position: relative; border:1px solid #aaaaaa;
						 width: {$width_box|escape:'quotes':'UTF-8'}px;
						 height: {$width_box|escape:'quotes':'UTF-8'}px; ">
				<div class="box_sticker" style="
						left:{$sticker_default_label_stylized.x_sticker|escape:'quotes':'UTF-8'}px;
						top: {$sticker_default_label_stylized.y_sticker|escape:'quotes':'UTF-8'}px;
						width:{$sticker_default_label_stylized.width_sticker|escape:'quotes':'UTF-8'}px;
						height:{$sticker_default_label_stylized.height_sticker|escape:'quotes':'UTF-8'}px;
						line-height:{$sticker_default_label_stylized.height_sticker|escape:'quotes':'UTF-8'}px;
						">
					<div class="label_stylized_sticker" style="
							color: {$sticker_default_label_stylized.color_font_sticker|escape:'quotes':'UTF-8'};
							font-size: {$sticker_default_label_stylized.size_font_sticker|escape:'quotes':'UTF-8'}px;
							background: {$sticker_default_label_stylized.color_background_sticker|escape:'quotes':'UTF-8'}
							">
						{$sticker_default_label_stylized.text_sticker|escape:'quotes':'UTF-8'}</span>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<!-- BLOCK TYPE STICKER END-->


<div class="row">
<div class="col-lg-8">
	<!-- BLOCK  IMAGE TYPE -->
	<div id="sticker_block_image" {if $sticker->type_sticker!=4}style="display: none;"{/if} >
		<div class="form-group">
			<label class="control-label col-lg-3">{l s='Picture' mod='blockstickersbobs'}</label>

			<div class="col-lg-9">
				{if $image_uploader['exist']}
					<div class="form-group">
						<div class="col-lg-12" id="thumbnail-images-thumbnails">
							<div><img src="{$image_uploader['image_url']|escape:'htmlall':'UTF-8'}" alt="" class="imgm img-thumbnail"/>

								<p><a class="btn btn-default"
									  href="{$current_url|escape:'htmlall':'UTF-8'}&amp;id_sticker={$sticker->id_sticker|escape:'html':'UTF-8'}&amp;redirect=sticker&amp;delete_image_sticker=1">
										<i class="icon-trash"></i> {l s='Delete' mod='blockstickersbobs'}
									</a>
								</p>
							</div>
						</div>
					</div>
				{/if}

				<div class="form-group">
					<div class="col-sm-6">
						<input id="thumbnail" type="file" name="thumbnail" class="hide"/>

						<div class="dummyfile input-group">
							<span class="input-group-addon"><i class="icon-file"></i></span>
							<input id="thumbnail-name" type="text" name="filename" value="" readonly/>
                        <span class="input-group-btn">
                            <button id="thumbnail-selectbutton" type="button" name="submitAddAttachments"
									class="btn btn-default"><i class="icon-folder-open"></i>
								{l s='Add file' mod='blockstickersbobs'}
							</button>
                        </span>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>


	<!-- BLOCK  IMAGE TYPE END -->


	<!-- BLOCK  BASIS -->
	<div id="sticker_block_basis" {if $sticker->type_sticker==4}style="display: none;"{/if}>

		<div class="form-group">
			<label class="control-label col-lg-3">{l s='Text' mod='blockstickersbobs'}</label>

			<div class="col-lg-6">
				<input type="text" name="text_sticker" maxlength="64"
					   value="{(string)$sticker->text_sticker|escape:'quotes':'UTF-8'}"/>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-lg-3">{l s='Font size' mod='blockstickersbobs'}</label>

			<div class="col-lg-1">
				<select name="size_font_sticker" id="visibility">
					<option value="5" {if $sticker->size_font_sticker==5 }selected="selected"{/if}>5</option>
					<option value="6" {if $sticker->size_font_sticker==6 }selected="selected"{/if}>6</option>
					<option value="7" {if $sticker->size_font_sticker==7 }selected="selected"{/if}>7</option>
					<option value="8" {if $sticker->size_font_sticker==8 }selected="selected"{/if}>8</option>
					<option value="9" {if $sticker->size_font_sticker==9 }selected="selected"{/if}>9</option>
					<option value="10" {if $sticker->size_font_sticker==10 }selected="selected"{/if}>10</option>
					<option value="11" {if $sticker->size_font_sticker==11 }selected="selected"{/if}>11</option>
					<option value="12" {if $sticker->size_font_sticker==12 }selected="selected"{/if}>12</option>
					<option value="13" {if $sticker->size_font_sticker==13 }selected="selected"{/if}>13</option>
					<option value="14" {if $sticker->size_font_sticker==14 }selected="selected"{/if}>14</option>
					<option value="15" {if $sticker->size_font_sticker==15 }selected="selected"{/if}>15</option>
					<option value="16" {if $sticker->size_font_sticker==16 }selected="selected"{/if}>16</option>
					<option value="17" {if $sticker->size_font_sticker==17 }selected="selected"{/if}>17</option>
					<option value="18" {if $sticker->size_font_sticker==18 }selected="selected"{/if}>18</option>
					<option value="19" {if $sticker->size_font_sticker==19 }selected="selected"{/if}>19</option>
					<option value="20" {if $sticker->size_font_sticker==20 }selected="selected"{/if}>20</option>
				</select>
			</div>
		</div>

		<!-- BLOCK COLOR FONT -->
		<div class="form-group">
			<label class="control-label col-lg-3">{l s='Color font' mod='blockstickersbobs'}</label>
			<div class="col-lg-9 ">
				<div class="form-group">
					<div class="col-lg-2">
						<div class="row">
							<div class="input-group">
								<input type="text" data-hex="true" class="color mColorPickerInput mColorPicker"
									   name="color_font_sticker"
									   value="{$sticker->color_font_sticker|escape:'quotes':'UTF-8'}" id="color_0"
									   style="background-color: {$sticker->color_font_sticker|escape:'quotes':'UTF-8'};
											   color: {$color_font_sticker_color|escape:'quotes':'UTF-8'};">
                            <span style="cursor:pointer;" id="icp_color_0"
								  class="mColorPickerTrigger input-group-addon" data-mcolorpicker="true">
                                <img src="../img/admin/color.png" style="border:0;margin:0 0 0 3px"
									 align="absmiddle">
                            </span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- BLOCK COLOR background-->
		<div class="form-group">
			<label class="control-label col-lg-3">{l s='Color background' mod='blockstickersbobs'}</label>

			<div class="col-lg-9 ">
				<div class="form-group">
					<div class="col-lg-2">
						<div class="row">
							<div class="input-group">
								<input type="text" data-hex="true" class="color mColorPickerInput mColorPicker"
									   name="color_background_sticker"
									   value="{$sticker->color_background_sticker|escape:'quotes':'UTF-8'}"
									   id="color_1"
									   style="background-color: {$sticker->color_background_sticker|escape:'quotes':'UTF-8'};
											   color:{$color_background_sticker_color|escape:'quotes':'UTF-8'};">
                            <span style="cursor:pointer;" id="icp_color_1"
								  class="mColorPickerTrigger input-group-addon" data-mcolorpicker="true">
                                <img src="../img/admin/color.png" style="border:0;margin:0 0 0 3px"
									 align="absmiddle">
                            </span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- WHTP -->
	<div id="sticker_block_WHTP"
			{if $sticker->type_sticker==0 || $sticker->type_sticker==1  || $sticker->type_sticker==3} style="display: none;"{/if}>
		<div class="form-group">
			<label class="control-label col-lg-3">{l s='Position X' mod='blockstickersbobs'}</label>
			<div class="col-lg-6">
				<input type="text" name="x_sticker" maxlength="64"
					   value="{$sticker->x_sticker|escape:'quotes':'UTF-8'}"/>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-lg-3">{l s='Position Y' mod='blockstickersbobs'}</label>

			<div class="col-lg-6">
				<input type="text" name="y_sticker" maxlength="64"
					   value="{$sticker->y_sticker|escape:'quotes':'UTF-8'}"/>
			</div>
		</div>


		<div class="form-group">
			<label class="control-label col-lg-3">{l s='Width sticker' mod='blockstickersbobs'}</label>

			<div class="col-lg-6">
				<input type="text" pattern="^[ 0-9]+$" name="width_sticker" maxlength="64"
					   value="{$sticker->width_sticker|escape:'quotes':'UTF-8'}"/>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-lg-3">{l s='Height sticker' mod='blockstickersbobs'}</label>

			<div class="col-lg-6">
				<input type="text" pattern="^[ 0-9]+$" name="height_sticker" maxlength="64"
					   value="{$sticker->height_sticker|escape:'quotes':'UTF-8'}"/>
			</div>
		</div>
	</div>

	<div id="sticker_block_horizontal_strip" {if $sticker->type_sticker!=3}style="display:none;"{/if} >

		<div class="form-group">
			<label class="control-label col-lg-3">{l s='Position Y' mod='blockstickersbobs'}</label>

			<div class="col-lg-6">
				<input type="text" name="y_sticker" maxlength="64"
					   value="{$sticker->y_sticker|escape:'quotes':'UTF-8'}"/>
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-lg-3">{l s='Height sticker' mod='blockstickersbobs'}</label>

			<div class="col-lg-6">
				<input type="text" name="height_sticker" maxlength="64"
					   value="{$sticker->height_sticker|escape:'quotes':'UTF-8'}"/>
			</div>
		</div>
	</div>

</div>

<!-- VIEWS -->
<div class="col-lg-4">
	<div class="radio sticker_radio">
		<label>
			{l s='View' mod='blockstickersbobs'}
		</label>
	</div>
	<div class=" col-lg-12">
		<div id="block_type_view_senior" class="block_type_view  center-block"
			 style=" position: relative;
					 border:1px solid #aaaaaa;
					 width: {$width_box|escape:'quotes':'UTF-8'}px;
					 height: {$width_box|escape:'quotes':'UTF-8'}px; ">
			<div class="box_sticker {if ($sticker->type_sticker==0) || ($sticker->type_sticker==1)}hidden{/if}"
				 id="box_sticker" style="
					left:{$sticker->x_sticker|escape:'quotes':'UTF-8'}px;
					top: {$sticker->y_sticker|escape:'quotes':'UTF-8'}px;
					width:{$sticker->width_sticker|escape:'quotes':'UTF-8'}px;
					height:{$sticker->height_sticker|escape:'quotes':'UTF-8'}px;
					line-height:{$sticker->height_sticker|escape:'quotes':'UTF-8'}px;
					">
				<div id="label_sticker" class="label_sticker {if $sticker->type_sticker!=2} hidden {/if}"
					 style="
							 color: {$sticker->color_font_sticker|escape:'quotes':'UTF-8'};
							 font-size: {$sticker->size_font_sticker|escape:'quotes':'UTF-8'}px;
							 background: {$sticker->color_background_sticker|escape:'quotes':'UTF-8'}
							 ">
					{$sticker->text_sticker|escape:'quotes':'UTF-8'}
				</div>

				<div id="horizontal_strip_sticker" class="horizontal_strip_sticker
                        {if $sticker->type_sticker!=3} hidden{/if}" style="
						color: {$sticker->color_font_sticker|escape:'quotes':'UTF-8'};
						font-size: {$sticker->size_font_sticker|escape:'quotes':'UTF-8'}px;
						line-height:{$sticker->height_sticker|escape:'quotes':'UTF-8'}px;
						background: {$sticker->color_background_sticker|escape:'quotes':'UTF-8'}
						">
					{$sticker->text_sticker|escape:'quotes':'UTF-8'}
				</div>

				<img id="image_sticker" class="image_sticker {if $sticker->type_sticker!=4}hidden {/if}"
					 src="{$current_url_img|escape:'htmlall':'UTF-8'}"
					 width="{$sticker->width_sticker|escape:'quotes':'UTF-8'}"
					 height="{$sticker->height_sticker|escape:'quotes':'UTF-8'}"
					 style="line-height:{$sticker->height_sticker|escape:'quotes':'UTF-8'}px;">

				<div id="label_stylized_sticker" class="label_stylized_sticker {if $sticker->type_sticker!=5} hidden {/if}"
					 style="
							 color: {$sticker->color_font_sticker|escape:'quotes':'UTF-8'};
							 font-size: {$sticker->size_font_sticker|escape:'quotes':'UTF-8'}px;
							 /*line-height:{$sticker->height_sticker|escape:'quotes':'UTF-8'}px;*/
							 background: {$sticker->color_background_sticker|escape:'quotes':'UTF-8'}
							 ">
					{$sticker->text_sticker|escape:'quotes':'UTF-8'}
				</div>
			</div>

			<div class="box_sticker {if $sticker->type_sticker!=0}hidden{/if}"
				 id="box_sticker_angle_right"
				 style="
						 right:{$sticker->x_sticker|escape:'quotes':'UTF-8'}px;
						 top: {$sticker->y_sticker|escape:'quotes':'UTF-8'}px;
						 width:{$sticker->width_sticker|escape:'quotes':'UTF-8'}px;
						 height:{$sticker->height_sticker|escape:'quotes':'UTF-8'}px;
						 ">
                <span id="angle_right_sticker" class="angle_right_sticker" style="
						color: {$sticker->color_font_sticker|escape:'quotes':'UTF-8'};
						font-size: {$sticker->size_font_sticker|escape:'quotes':'UTF-8'}px;
						background: {$sticker->color_background_sticker|escape:'quotes':'UTF-8'}
						">
                                {$sticker->text_sticker|escape:'quotes':'UTF-8'}
                </span>
			</div>

			<div class="box_sticker box_sticker_left {if $sticker->type_sticker!=1}hidden{/if}"
				 id="box_sticker_angle_left"
				 style="
						 left:{$sticker->x_sticker|escape:'quotes':'UTF-8'}px;
						 top: {$sticker->y_sticker|escape:'quotes':'UTF-8'}px;
						 width:{$sticker->width_sticker|escape:'quotes':'UTF-8'}px;
						 height:{$sticker->height_sticker|escape:'quotes':'UTF-8'}px;
						 ">
                <span id="angle_left_sticker" class="angle_left_sticker" style="
						color: {$sticker->color_font_sticker|escape:'quotes':'UTF-8'};
						font-size: {$sticker->size_font_sticker|escape:'quotes':'UTF-8'}px;
						background: {$sticker->color_background_sticker|escape:'quotes':'UTF-8'}
						">
                    {$sticker->text_sticker|escape:'quotes':'UTF-8'}
                </span>
			</div>

		</div>

		<p id="message_view_stickers" class="help-block text-center
            {if $sticker->type_sticker<2} hidden {/if}" style="color:#0088ff">
			{l s='You can change the position of the sticker with the help of your mouse!' mod='blockstickersbobs'}</p>
	</div>

</div>
</div>
<hr>
<div class="row"
<div class="panel-footer" id="toolbar-footer">
	<button type="submit" class="btn btn-default pull-right">
		<i class="process-icon-save"></i> <span>{l s='Save' mod='blockstickersbobs'}</span>
	</button>
	<a class="btn btn-default" href="{$current_url|escape:'htmlall':'UTF-8'}&amp;id_sticker={$sticker->id_sticker|escape:'html':'UTF-8'}&amp;redirect={$redirect|escape:'html':'UTF-8'}">
		<i class="process-icon-cancel"></i> <span>{l s='Cancel' mod='blockstickersbobs'}</span>
	</a>
</div>
</div>


</form>
</div>



