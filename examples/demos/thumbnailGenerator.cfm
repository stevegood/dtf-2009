<h3>Thumbnail Generator</h3>

<table>
	<tr>
		<td><cfoutput>#application.output.formElements.getimageSelect()#</cfoutput></td>
	</tr>
	<tr>
		<td>
			Border Color <input id="borderColor" type="text" value="FFFFFF"/>
		</td>
	</tr>
	<tr>
		<td>
			Border Width <input id="borderWidth" type="text" value="0" />
		</td>
	</tr>
	<tr>
		<td>
			Thumbnail Width <input id="imageWidth" type="text" value="50" />
		</td>
	</tr>
	<tr>
		<td>
			Thumbnail Height <input id="imageHeight" type="text" value="50" />
		</td>
	</tr>
	<tr>
		<td>
			<input id="submitBtn" type="button" value="Create Tumbnail" />
		</td>
	</tr>
	<tr>
		<td id="thumbnail_output"></td>
	</tr>
</table>

<script type="text/javascript" language="javascript">
$(document).ready(function(){
	$('#borderColor').ColorPicker({
		onSubmit: function(hsb, hex, rgb, el){
			$(el).val(hex).ColorPickerHide();
		},
		onBeforeShow: function () {
			$(this).ColorPickerSetColor(this.value);
		}
	});
	
	$('#submitBtn').click(function(){
		if ($('#imageSelect').val() == 0){
			alert('Select an image!');
			$('#imageSelect').focus();
			return false;
		}
		
		$('#thumbnail_output').load('/examples/demos/thumbnailGeneratorDisplay.cfm?fullPath=' + $('#imageSelect').val() + '&borderColor=' + $('#borderColor').val() + '&borderWidth=' + $('#borderWidth').val() + '&imageWidth=' + $('#imageWidth').val() + '&imageHeight=' + $('#imageHeight').val());
	});
});
</script>