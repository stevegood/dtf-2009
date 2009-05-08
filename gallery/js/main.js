var endpoint = 'http://localhost:8301/';
var facadePath = 'com/gallery/facades/';
var imageFacade = 'ImageFacade.cfc?callback=?';
var albumFacade = 'AlbumFacade.cfc?callback=?';

var selectedAlbumID = 0;

$(document).ready(function(){
	// setup app defaults
	$('#edit-album-link').hide();
	$('#delete-album-link').hide();
	$('#add-edit-window').jqm({modal: true});
	
	// go grab the albums
	getAllAlbums();
	
	// handle when the album selection changes
	$('#album-select').change(function(){
		var id = $(this).val();
		if (id == 0){
			$('#edit-album-link').hide();
			$('#delete-album-link').hide();
		} else {
			$('#edit-album-link').show();
			$('#delete-album-link').show();
		}
		
		selectedAlbumID = id;
		
		onAlbumChange(id);
	});
	
	// navigation clicks
	$('#new-album-link').click(function(){
		onNewAlbumLinkClick();
	});
	
	$('#edit-album-link').click(function(){
		var id = $('#album-select').val();
		if (id != 0){
			onEditAlbumLinkClick(id);
		}
	});
	
	$('#delete-album-link').click(function(){
		var id = $('#album-select').val();
		if (id != 0){
			onDeleteAlbumLinkClick(id);
		}
	});
	
	$('#aew-close-link').click(function(){
		onAEWClose();
	});
	
	$('#aew-cancel').click(function(){
		onAEWClose();
	});
	
	$('#aew-submit').click(function(){
		var id = $('#aew-album-id').val();
		var name = $('#aew-name-input').val();
		var description = $('#aew-description-input').val();
		
		if (id == 0){
			createAlbum(name, description);
		} else {
			editAlbum(id, name, description);
		}
	});
	
	$('#new-image-link').click(function(){
		
	});
});

function getAllAlbums(){
	var url = endpoint + facadePath + albumFacade;
	var args = {method: 'getAlbums', returnFormat: 'plain'};
	$.getJSON(
		url,
		args,
		function(result){
			var html = '<option value="0">Select an album...</option>';
			var selected = '';
			
			for (var i = 0; i < result.length; i++){
				if (result[i].id == selectedAlbumID){
					selected = ' selected=selected ';
				}
				html += '<option id="album-select-option' + result[i].id + '" value="' + result[i].id + '" ' + selected + '>' + result[i].name + '</option>';
			}
			$('#album-select').html(html);
			
			for (var i = 0; i < result.length; i++){
				var target = '#album-select-option' + result[i].id;
				$(target).data('album',result[i]);
			}
			$('#album-select').trigger('change');
		}
	);
};

function onAlbumChange(id){
	var target = '#album-select-option' + id;
	if (id != 0){
		var description = $(target).data('album').description;
		$('#album-description').html(description).animate({opacity:'show'}, 300, null, function(){
			getAlbum(id);
		});
	} else {
		$('#album').animate({opacity: 'hide'},300,null,function(){
			$('#album-description').animate({opacity: 'hide'}, 300, null, function(){
				
			});
		});
	}
}

function getAlbum(id){
	var url = endpoint + facadePath + imageFacade;
	var args = {method: 'getAlbumImages', returnFormat: 'plain', albumID: id};
	$.getJSON(
		url,
		args,
		function(result){
			var html = '';
			for (var i = 0; i < result.length; i++){
				html += '<img src="' + result[i].base64 + '" height="' + result[i].height + '" width="' + result[i].width + '"/><br/>';
			}
			$('#album').html(html).animate({opacity:'show'}, 500);
		}
	);
};

function onNewAlbumLinkClick(){
	resetAEWVals();
	$('#add-edit-window').jqmShow();
};

function onEditAlbumLinkClick(id){
	var target = '#album-select-option' + id;
	var name = $(target).data('album').name;
	var description = $(target).data('album').description;
	
	$('#aew-album-id').val(id);
	$('#aew-name-input').val(name);
	$('#aew-description-input').val(description);
	$('#add-edit-window').jqmShow();
};

function onDeleteAlbumLinkClick(id){
	var target = '#album-select-option' + id;
	var name = $(target).data('album').name;
	var doDelete = confirm('This action can not be undone and all images in this album will be lost! Are you sure you want to delete album "' + name + '" ?');
	
	if (doDelete){
		var url = endpoint + facadePath + albumFacade;
		var args = {
						method: 'deleteAlbum',
						albumID: id,
						returnFormat: 'plain'
					};
		$.getJSON(
			url,
			args,
			function(result){
				selectedAlbum = 0;
				$('#album-select').val(0);
				getAllAlbums();
			}
		);
	}
}

function onAEWClose(){
	$('#add-edit-window').jqmHide();
	resetAEWVals();
};

function resetAEWVals(){
	$('#aew-album-id').val(0);
	$('#aew-name-input').val('');
	$('#aew-description-input').val('');
};

function createAlbum(name, description){
	var url = endpoint + facadePath + albumFacade;
	var args = {
					method: 'createAlbum',
					name: name,
					description: description,
					returnFormat: 'plain'
				};
	$.getJSON(
		url,
		args,
		function(result){
			onAEWClose();
			getAllAlbums();
		}
	);
};

function editAlbum(id, name, description){
	var url = endpoint + facadePath + albumFacade;
	var args = {
					method: 'updateAlbum',
					albumid: id,
					name: name,
					description: description,
					returnFormat: 'plain'
				};
	$.getJSON(
		url,
		args,
		function(result){
			onAEWClose();
			getAllAlbums();
		}
	);
};