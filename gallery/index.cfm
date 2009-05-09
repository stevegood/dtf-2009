<html>

	<head>
		<title>jQuery / ColdFusion Gallery Demo</title>
		
		<!-- Framework CSS -->
		<link rel="stylesheet" href="css/blueprint/screen.css" type="text/css" media="screen, projection">
		<link rel="stylesheet" href="css/blueprint/print.css" type="text/css" media="print">
	 	<!--[if IE]><link rel="stylesheet" href="css/blueprint/ie.css" type="text/css" media="screen, projection"><![endif]-->
		<!-- Import fancy-type plugin for the sample page. -->
		<link rel="stylesheet" href="css/blueprint/plugins/fancy-type/screen.css" type="text/css" media="screen, projection">
		<link rel="stylesheet" href="css/black-tie/jquery-ui-1.7.custom.css" media="screen, projection" />
		<link rel="stylesheet" href="./css/main.css" type="text/css" media="screen" />
		
		<script src="./js/jquery-1.3.2.min.js" type="text/javascript"></script>
		<script src="./js/jquery-ui-1.7.custom.min.js" type="text/javascript"></script>
		<script src="./js/jquery.jqModal.js" type="text/javascript"></script>
		<script src="./js/main.js" type="text/javascript"></script>
	</head>
	
	<body>
		<div id="album-nav" class="ui-state-highlight container">
			<select id="album-select">
				<option value="0">Select an album...</option>
			</select>
			<span id="album-links">
				<a id="new-album-link" href="javascript:void(0);">New</a>
				<a id="edit-album-link" href="javascript:void(0);">Edit</a>
				<a id="delete-album-link" href="javascript:void(0);">Delete</a>
			</span>
		</div>
		<div id="album-views" class="container">
			<div id="image-nav" class="hidden">
				<a href="javascript:void(0);" id="new-image-link">Add Image</a>
			</div>
			<div id="album-description" class="hidden"></div>
			<div id="album" class="hidden"></div>
			<div id="image-preview" class="hidden"></div>
		</div>
		
		
		<!-- modal window for adding / editing an album. Hidden by default -->
		<div id="add-edit-window" class="jqmWindow">
			<input type="hidden" id="aew-album-id" value="" />
			<div class="aew-title-bar">
				<h3 id="aew-title"></h3>
				<a href="javascript:void(0);" id="aew-close-link">[X]</a>
			</div>
			<div id="aew-body">
				<table>
					<tr>
						<td style="text-align:right;">Name:</td>
						<td>
							<input type="text" id="aew-name-input" style="width:100%;" />
						</td>
					</tr>
					<tr>
						<td style="text-align:right;">Description:</td>
						<td>
							<input type="text" id="aew-description-input" style="width:100%;" />
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:right;">
							<input type="button" id="aew-submit" value="Save" />
							<input type="button" id="aew-cancel" value="Cancel" />
						</td>
					</tr>
				</table>
			</div>
		</div>
		
		<!-- modal window for adding new images to an album -->
		<div id="add-image-window" class="jqmWindow">
			<input type="hidden" id="aiw-image-id" value="" />
			<div id="aiw-title-bar">
				<h3 id="aiw-title"></h3>
				<a href="javascript:void(0);" id="aiw-close-link">[X]</a>
			</div>
			<div id="aiw-body">
				<table>
					<tr>
						<td style="text-align:right;">Name:</td>
						<td>
							<input type="text" id="aiw-name-input" style="width:100%;" />
						</td>
					</tr>
					<tr>
						<td style="text-align:right;">Description:</td>
						<td>
							<input type="text" id="aiw-description-input" style="width:100%;" />
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:right;">
							<input type="button" id="aiw-submit" value="Save" />
							<input type="button" id="aiw-cancel" value="Cancel" />
						</td>
					</tr>
				</table>
			</div>
		</div>
	</body>

</html>