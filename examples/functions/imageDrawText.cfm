
<cfset pageid = hash(CreateUUID()) />

<style>
#output_<cfoutput>#pageid#</cfoutput> {
	overflow: auto;
}
</style>

<div class="span-16">
	<h3>ImageDrawText()</h3>
	<table>
		<tr>
			<td>
				<cfoutput>#application.output.formElements.getImageSelect()#</cfoutput>
			</td>
		</tr>
		<tr>
			<td>
				X Coord <input id="xCoord" type="text" value="10"/>
			</td>
		</tr>
		<tr>
			<td>
				Y Coord <input id="yCoord" type="text" value="50" />
			</td>
		</tr>
		<tr>
			<td>
				Text <input id="textString" type="text" value="ColdFusion" />
			</td>
		</tr>
		<tr>
			<td>
				<input id="submitBtn" type="button" value="Add Text" />
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
		$(target).load('/examples/functions/imageDrawTextDisplay.cfm?fullPath=' + $('#imageSelect').val() + '&textString=' + $('#textString').val() + '&xCoord=' + $('#xCoord').val() + '&yCoord=' + $('#yCoord').val());
	});
});
</script>