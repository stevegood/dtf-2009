var source = '/com/gallery/facades/';
var imageFacade = 'ImageFacade.cfc';
var albumFacade = 'AlbumFacade.cfc';

var selectedAlbumID = 0;
var selectedImageID = 0;

$(document).ready(function(){
	// setup app defaults
	$('#edit-album-link').hide();
	$('#delete-album-link').hide();
	$('#add-edit-window').jqm({modal: true});
	$('#add-image-window').jqm({modal:true});
	
	// custom event binds
	$(document).bind('getAllAlbums',function(){
		var url = source + albumFacade;
		var args = {method: 'getAlbums', returnFormat: 'json'};
		$.getJSON(
			url,
			args,
			function(result){
				var defaultOption = $('<option value="0">Select an album...</option>');
				$('#album-select').html(defaultOption);
				
				for (var i = 0; i < result.length; i++){
					var option = $('<option id="album-select-option' + result[i].id + '" value="' + result[i].id + '">' + result[i].name + '</option>');
					option.data('album',result[i]);
					if (result[i].id == selectedAlbumID){
						option.attr('selected','selected');
					}
					$('#album-select').append(option);
				}
				$('#album-select').trigger('change');
			}
		);
	});
	
	$(document).bind('resetAEWVals',function(){
		$('#aew-album-id').val(0);
		$('#aew-name-input').val('');
		$('#aew-description-input').val('');
	});
	
	$(document).bind('onAEWClose',function(){
		$('#add-edit-window').jqmHide();
		$(document).trigger('resetAEWVals');
	});
	
	$(document).bind('resetImageEditor',function(){
		$('#aiw-image-id').val(0);
		$('#aiw-name-input').val('');
		$('#aiw-description-input').val('');
	});
	
	$(document).bind('onAIWClose',function(){
		$(document).trigger('resetImageEditor');
		$('#add-image-window').jqmHide();
	});
	
	// handle when the album selection changes
	$('#album-select').change(function(){
		var id = $(this).val();
		if (id == 0){
			$('#edit-album-link').hide();
			$('#delete-album-link').hide();
			$('#image-nav').hide();
			$('#image-preview').animate({opacity: 'hide'},500);
		} else {
			$('#edit-album-link').show();
			$('#delete-album-link').show();
			$('#image-preview').animate({opacity: 'hide'},500);
		}
		
		selectedAlbumID = id;
		
		var target = '#album-select-option' + id;
		if (id != 0){
			var description = $(target).data('album').description;
			$('#album-description').html(description).animate({opacity:'show'}, 300, null, function(){
				var url = source + imageFacade;
				var args = {method: 'getAlbumImages', returnFormat: 'json', albumID: id};
				$('#image-nav').show();
				$.getJSON(
					url,
					args,
					function(result){
						$('#album').html(''); // clear the content
						for (var i = 0; i < result.length; i++){
							var image = $('<img id="tumbnail-' + result[i].id + '" class="thumbnail" src="' + result[i].base64 + '" height="' + result[i].height + '" width="' + result[i].width + '"/><br/>');
							image.data('image',result[i]);
							$('#album').append(image);
						}
						$('#album').animate({opacity:'show'}, 500);
					}
				);
			});
		} else {
			$('#album').animate({opacity: 'hide'},300,null,function(){
				$('#album-description').animate({opacity: 'hide'}, 300);
			});
		}
	});
	
	// navigation clicks
	$('#new-album-link').click(function(){
		$(document).trigger('resetAEWVals');
		$('#add-edit-window').jqmShow();
	});
	
	$('#edit-album-link').click(function(){
		var id = $('#album-select').val();
		if (id != 0){
			var target = '#album-select-option' + id;
			var name = $(target).data('album').name;
			var description = $(target).data('album').description;
			
			$('#aew-album-id').val(id);
			$('#aew-name-input').val(name);
			$('#aew-description-input').val(description);
			$('#add-edit-window').jqmShow();
		}
	});
	
	$('#delete-album-link').click(function(){
		var id = $('#album-select').val();
		if (id != 0){
			var target = '#album-select-option' + id;
			var name = $(target).data('album').name;
			var doDelete = confirm('This action can not be undone and all images in this album will be lost! Are you sure you want to delete album "' + name + '" ?');
			
			if (doDelete){
				var url = source + albumFacade;
				var args = {
								method: 'deleteAlbum',
								albumID: id,
								returnFormat: 'json'
							};
				$.getJSON(
					url,
					args,
					function(result){
						selectedAlbum = 0;
						$('#album-select').val(0);
						$(document).trigger('getAllAlbums');
					}
				);
			}
		}
	});
	
	$('#aew-close-link').click(function(){
		$(document).trigger('onAEWClose');
	});
	
	$('#aew-cancel').click(function(){
		$(document).trigger('onAEWClose');
	});
	
	$('#aew-submit').click(function(){
		var id = $('#aew-album-id').val();
		var name = $('#aew-name-input').val();
		var description = $('#aew-description-input').val();
		
		if (id == 0){
			var url = source + albumFacade;
			var args = {
							method: 'createAlbum',
							name: name,
							description: description,
							returnFormat: 'json'
						};
			$.getJSON(
				url,
				args,
				function(result){
					$(document).trigger('onAEWClose');
					$(document).trigger('getAllAlbums');
				}
			);
		} else {
			var url = source + albumFacade;
			var args = {
							method: 'updateAlbum',
							albumid: id,
							name: name,
							description: description,
							returnFormat: 'json'
						};
			$.getJSON(
				url,
				args,
				function(result){
					$(document).trigger('onAEWClose');
					$(document).trigger('getAllAlbums');
				}
			);
		}
	});
	
	$('#new-image-link').click(function(){
		$(document).trigger('resetImageEditor');
		
		var imageDiv = $('<div id="image-file"></div>');
		$('td.image-file').html(imageDiv);
		
		$('#image-file').fileUpload({
			'uploader': 'js/uploadify/uploader.swf',
			'script': source + imageFacade,
			'cancelImg': 'js/uploadify/cancel.png',
			'scriptData': {'method': 'addImage', 'albumID': selectedAlbumID, 'returnFormat': 'json'},
			'displayData': 'percentage',
			onComplete: function(event, queueID, fileObj, response){
				var args = {
							method: 'updateImageDetail',
							id: response,
							displayName: $('#aiw-name-input').val(),
							description: $('#aiw-description-input').val(),
							returnFormat: 'json'
						   }
				$.getJSON(
					source + imageFacade,
					args,
					function(result){
						$('#add-image-window').jqmHide();
						$('#album-select').change();
					}
				);
			}
		});
		
		$('#add-image-window').jqmShow();
	});
	
	$('.thumbnail').live('click',function(){
		var id = $(this).data('image').id;
		if (id != selectedImageID){
			selectedImageID = id;
			$('#image-preview').animate({opacity: 'hide'},500);
			var url = source + imageFacade;
			var args = {
							method: 'getImage',
							returnFormat: 'json',
							imageID: id
						};
			$.getJSON(
				url,
				args,
				function(result){
					var html = '<img src="' + result.base64 + '" height="' + result.height + 'px" width="' + result.width + 'px" />';
					$('#image-preview').html(html);
					$('#image-preview').animate({opacity: 'show'},500);
				}
			);
		}
	});
	
	$('#aiw-close-link').click(function(){
		$(document).trigger('onAIWClose');
	});
	$('#aiw-cancel').click(function(){
		$(document).trigger('onAIWClose');
	});
	$('#aiw-submit').click(function(){
		$('#image-file').fileUploadStart();
	});
	
	// dispatch the getAllAlbums event
	$(document).trigger('getAllAlbums');
});