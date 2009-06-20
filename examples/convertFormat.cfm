
<cfset pageid = hash(CreateUUID()) />

<style>
#output_<cfoutput>#pageid#</cfoutput> {
	overflow: auto;
}
</style>

<div class="span-16">
	<h3>Covert Image Format</h3>
	<table>
		<tr>
			<td>
				<cfoutput>#application.output.formElements.getImageSelect()#</cfoutput>
			</td>
		</tr>
		<tr>
			<td>
				<cfoutput>#application.output.formElements.getFormatSelect()#</cfoutput>
			</td>
		</tr>
		<tr>
			<td>
				<input id="submitBtn" type="button" value="Convert Image">
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
		if ($('#formatSelect').val() == 0){
			alert('Select a format!');
			$('#formatSelect').focus();
			return false;
		}
		
		$(target).load('/examples/convertFormatDisplay.cfm?fullPath=' + $('#imageSelect').val() + '&imageFormat=' + $('#formatSelect').val());
	});
});
</script>