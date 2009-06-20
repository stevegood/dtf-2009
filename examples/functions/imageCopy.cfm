
<cfset pageid = hash(CreateUUID()) />

<style>
#output_<cfoutput>#pageid#</cfoutput> {
	overflow: auto;
}
</style>

<div class="span-16">
	<h3>ImageCopy()</h3>
	<table>
		<tr>
			<td>
				<cfoutput>#application.output.formElements.getImageSelect()#</cfoutput>
			</td>
		</tr>
		<tr>
			<td>
				X Coord <input id="xCoord" type="text" value="0"/>
			</td>
		</tr>
		<tr>
			<td>
				Y Coord <input id="yCoord" type="text" value="0" />
			</td>
		</tr>
		<tr>
			<td>
				Height <input id="height" type="text" value="50" />
			</td>
		</tr>
		<tr>
			<td>
				Width <input id="width" type="text" value="50" />
			</td>
		</tr>
		<tr>
			<td>
				<input id="submitBtn" type="button" value="Copy Image Area" />
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
	$('#submitBtn').click(function(){
		var target = '#output_' + pageid;
		if ($('#imageSelect').val() == 0){
			alert('Select an image!');
			$('#imageSelect').focus();
			return false;
		}
		$(target).load('/examples/functions/imageCopyDisplay.cfm?fullPath=' + $('#imageSelect').val() + '&width=' + $('#width').val() + '&height=' + $('#height').val() + '&xCoord=' + $('#xCoord').val() + '&yCoord=' + $('#yCoord').val());
	});
});
</script>