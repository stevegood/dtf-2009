<cfparam name="url.captcha" default=""/>

<cfif isDefined('session.captcha')>
	<cfif session.captcha IS url.captcha>
		<p>Correct! The captch value is <cfoutput>#session.captcha#</cfoutput></p>
	<cfelse>
		<p>Wrong! You should try again. (hint: it's not <cfoutput>#url.captcha#</cfoutput>)</p>
	</cfif>
<cfelse>
	<p>Something went wrong, try refreshing the page.</p>
</cfif>