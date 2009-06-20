
<cfset pageid = hash(CreateUUID()) />

<style>
#output_<cfoutput>#pageid#</cfoutput> {
	overflow: auto;
}
</style>

<div class="span-16">
	<h3>ImageAddBorder()</h3>
	<table>
		<tr>
			<td>
				<cfoutput>#application.output.formElements.getImageSelect()#</cfoutput>
			</td>
		</tr>
		<tr>
			<td>
				Border Width: <input id="borderWidth" type="text" value="10"/>
			</td>
		</tr>
		<tr>
			<td id="picker">
				Border Color: <input id="borderColor" type="text" value="FF0000" />
			</td>
		</tr>
		<tr>
			<td>
				<input id="submitBtn" type="button" value="Add Border">
			</td>
		</tr>
		<tr>
			<td id="output_<cfoutput>#pageid#</cfoutput>"></td>
		</tr>
	</table>
</div>

<script type="text/javascript">
var pageid = '<cfoutput>#pageid#</cfoutput>';

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
		var target = '#output_' + pageid;
		if ($('#imageSelect').val() == 0){
			alert('Select an image!');
			$('#imageSelect').focus();
			return false;
		}
		$(target).load('/examples/functions/imageAddBorderDisplay.cfm?fullPath=' + $('#imageSelect').val() + '&borderWidth=' + $('#borderWidth').val() + '&borderColor=' + $('#borderColor').val());
	});
});
</script>