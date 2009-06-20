
<cfset pageid = hash(CreateUUID()) />
<cfset session.captcha = application.service.captcha.getRandString(10) />
<style>
#output_<cfoutput>#pageid#</cfoutput> {
	overflow: auto;
}
</style>

<div class="span-16">
	<h3>Create and use a CAPTCHA</h3>
	<table>
		<tr>
			<td>
				( <cfoutput><span class="error">#session.captcha#</span></cfoutput> )
				<br /><br />
				&lt;cfset <span class="added">rnd</span> = RandRange(1,3) /&gt;<br />
				&lt;cfset <span class="highlight">difficulty</span> = ['low','medium','high'] /&gt;<br />
				&lt;cfset <span class="highlight">difficulty</span> = <span class="highlight">difficulty</span>[<span class="added">rnd</span>] /&gt;<br /><br />
				&lt;cfimage action="captcha" text="<span class="error">#session.captcha#</span>" height="75" width="300" difficulty="<span class="highlight">#difficulty#</span>"&gt;
			</td>
		</tr>
		<tr>
			<td>
				<cfset rnd = RandRange(1,3) />
				<cfset difficulty = ['low','medium','high'] />
				<cfset difficulty = difficulty[rnd] />
				<cfoutput>#difficulty# difficulty</cfoutput><br />
				<cfimage action="captcha" text="#session.captcha#" height="75" width="300" difficulty="#difficulty#">
			</td>
		</tr>
		<tr>
			<td>
				<input id="captchaRepeat" type="text" />
			</td>
		</tr>
		<tr>
			<td>
				<input id="submitBtn" type="button" value="Validate CAPTCHA"/>
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
		if ($('#captchaRepeat').val().length == 0){
			alert('Enter a CAPTCHA guess');
			$('#captchaRepeat').focus();
			return false;
		}
		
		$(target).load('/examples/captchaDisplay.cfm?captcha=' + $('#captchaRepeat').val());
	});
});
</script>