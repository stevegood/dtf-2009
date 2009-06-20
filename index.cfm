<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta content="Boks - 0.3" name="generator"/>
	<title>Dallas Tech Fest 2009 - Native ColdFusion Image Manipulation</title>
	<!-- Framework CSS -->
	<link rel="stylesheet" href="css/screen.css" type="text/css" media="screen, projection"/>
	<link rel="stylesheet" href="css/print.css" type="text/css" media="print"/>
	<!--[if IE]><link rel="stylesheet" href="css/ie.css" type="text/css" media="screen, projection"/><![endif]-->
	<link rel="stylesheet" href="css/colorpicker.css" type="text/css" media="screen"/>
	<style>
	#header {
		background: url('img/top-grad-bg.png');
		background-repeat:repeat-x;
		background-position: 0 -15px;
		background-color: #666666;
		color:#FFFFFF;
		font-weight:bold;
		padding-bottom:7px;
		border-left: 2px solid #000000;
		border-top: 2px solid #000000;
		border-right: 2px solid #000000;
	}
	#header h3 {
		color:#FFFFFF;
		margin-top:7px;
		margin-bottom:2px;
		margin-left: -10px;
	}
	a {
		color: #FFFFFF;
		text-decoration:none;
	}
	a:hover {
		color: #99CCCC;
		text-decoration: underline;
	}
	#nav ul.outer {
		margin-left:-60px;
		margin-top: 15px;
		list-style-type:none;
		font-weight:bold;
		font-size:14px;
		color:#FFFFFF;
	}
	#nav ul.inner {
		margin-left: 20px;
		list-style-type:none;
		font-weight:normal;
		font-size:12px;
	}
	#footer {
		background: url('img/bottom-grad-bg.png');
		background-repeat:repeat-x;
		background-position: 0 1px;
		background-color: #666666;
		color:#FFFFFF;
		font-weight: bold;
		border-left: 2px solid #000000;
		border-bottom: 2px solid #000000;
		border-right: 2px solid #000000;
	}
	#middle {
		background-color: #FFFFFF;
		background: url('img/grad-bg.png');
		background-repeat: repeat-y;
		background-position:-175px;
		border-left: 2px solid #000000;
	}
	#main {
		word-wrap:break-word;
		overflow:auto;
	}
	.highlight2 {
		color:#FFFFFF;
		background-color: #990033;
	}
	.highlight3 {
		color:#000000;
		background-color:#87d2fa;
	}
	.highlight4 {
		color:#000000;
		background-color:#ec9eff;
	}
	.highlight5 {
		color:#000000;
		background-color:#DCDCDC;
	}
	.error {
		padding:0;
		color:#000000;
	}
	th {
		text-align: right;
	}
	td {
		text-align:left;
	}
	</style>
	
	<script type="text/javascript" language="javascript" src="/js/jquery.js"></script>
	
</head>
<body>
	<div class="container">
	  <div class="span-24 prepend-1 append-1 last" id="header">
      	<h3><a href="/">Native ColdFusion Image Manipulation</a></h3>
		<span>Dallas Tech Fest 2009</span>
	  </div>
	  <div class="clear span-24 prepend-1 append-1 last" id="middle">
	    <div class="span-6 prepend-1" id="nav">
			<ul class="outer">
				<li>Basic Tag Actions</li>
				<li>
				    <ul class="inner">
						<li>
							<a href="/examples/readingWriting.cfm">Reading and Writing Images</a>
						</li>
						<li>
							<a href="/examples/imageProperties.cfm">Accessing Image Properties</a>
						</li>
						<li>
							<a href="/examples/addingBorder.cfm">Adding a Border</a>
						</li>
						<li>
							<a href="/examples/resizing.cfm">Resizing an Image</a>
						</li>
						<li>
							<a href="/examples/rotating.cfm">Rotating and Image</a>
						</li>
						<li>
							<a href="/examples/convertFormat.cfm">Convert to Another Format</a>
						</li>
						<li>
							<a href="/examples/captcha.cfm">Creating and Using a Captcha</a>
						</li>
					</ul>
				</li>
				<li>Related Functions</li>
				<li>
					<ul class="inner">
						<li>
							<a href="/examples/functions/imageAddBorder.cfm">ImageAddBorder()</a>
						</li>
						<li>
							<a href="/examples/functions/imageCopy.cfm">ImageCopy()</a>
						</li>
						<li>
							<a href="/examples/functions/drawBeveledRect.cfm">ImageDrawBeveledRect()</a>
						</li>
						<li>
							<a href="/examples/functions/imageDrawText.cfm">ImageDrawText()</a>
						</li>
						<li>
							<strong>Many more...</strong>
						</li>
					</ul>
				</li>
				<li>Demo Applications</li>
				<li>
					<ul class="inner">
						<li>
							<a href="/examples/demos/thumbnailGenerator.cfm">Thumbnail Generator</a>
						</li>
						<li>
							<a href="/gallery/index.html" target="_blank">jQuery Gallery</a>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	    <div class="span-17 last" id="main">
			<h4>CFImage Examples</h4>
			<p>Click the links on the left to view the example and sample code for that demo</p>
		</div>
	  </div>
	  <div class="clear span-24 prepend-1 append-1 last" id="footer">
		&copy; 2009 Steve Good | 
		<a href="http://lanctr.com/" target="_blank">http://lanctr.com/</a> | 
		<a href="http://twitter.com/stevegood" target="_blank">@stevegood</a> | 
		<a href="http://slantsoft.com/" target="_blank">http://slantsoft.com/</a>
	  </div>
	</div>

	<script type="text/javascript" language="javascript">
	$(document).ready(function(){
		$.getScript('/js/colorpicker.js');
		
		$('#nav a').each(function(){
			if ($(this).attr('href') != '/gallery/index.html'){
				$(this).data('url',{url:$(this).attr('href')}).attr('href','javascript:void(0);');
				$(this).click(function(){
					$('#main').load($(this).data('url').url);
				});
			}
		});
	});
	</script>

</body>
</html>