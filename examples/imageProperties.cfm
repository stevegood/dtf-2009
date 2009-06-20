
<cfset pageid = hash(CreateUUID()) />

<style>
#output_<cfoutput>#pageid#</cfoutput> {
	overflow: auto;
}
</style>

<div class="span-16">
	<h3>Image Properties</h3>
	<table>
		<tr>
			<td>
				<cfoutput>#application.output.formElements.getImageSelect()#</cfoutput>
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
	$('#imageSelect').change(function(){
		var target = '#output_' + pageid;
		$(target).load('/examples/imagePropertiesDisplay.cfm?fullPath=' + $(this).val());
	});
});
</script>