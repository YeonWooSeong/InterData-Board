<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<title>interdata</title>
	<link rel="stylesheet" href="${css}/common.css"/>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.0.0/magnific-popup.min.css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.0.0/jquery.magnific-popup.min.js"></script>
	
	
</head>
<body>
	<div id="wrop">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content">
			<section class="sectionClass">
				<div class="mainView">
					<tiles:insertAttribute name="content" />
				</div>
			</section>
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>

