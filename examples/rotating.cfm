
<cfset pageid = hash(CreateUUID()) />

<style>
#output_<cfoutput>#pageid#</cfoutput> {
	overflow: auto;
}
</style>

<div class="span-16">
	<h3>Rotating an Image</h3>
	<table>
		<tr>
			<td>
				<cfoutput>#application.output.formElements.getImageSelect()#</cfoutput>
			</td>
		</tr>
		<tr>
			<td>
				Rotation Degrees (-360 ~ 360): <input id="rotationDegrees" type="text" value="-90"/>
			</td>
		</tr>
		<tr>
			<td>
				<input id="submitBtn" type="button" value="Rotate Image">
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
		
		if ($('#rotationDegrees').val() < -360 || $('#rotationDegrees').val() > 360){
			alert('Choose a value between -360 and 360');
			$('#rotationDegrees').focus();
			return false;
		}
		
		$(target).load('/examples/rotatingDisplay.cfm?fullPath=' + $('#imageSelect').val() + '&rotationDegrees=' + $('#rotationDegrees').val());
	});
});
</script>