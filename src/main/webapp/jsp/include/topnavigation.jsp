  <div class="app">
        <!-- top header -->
        
        <c:url value="/j_spring_security_logout" var="logoutUrl" />
	<form action="${logoutUrl}" method="post" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
	<script>
		function formSubmit() {
			document.getElementById("logoutForm").submit();
		}
	</script>
        
        <header class="header header-fixed navbar">

            <div class="brand">
                <!-- toggle offscreen menu -->
                <a href="javascript:;" class="ti-menu off-left visible-xs" data-toggle="offscreen" data-move="ltr"></a>
                <!-- /toggle offscreen menu -->

                <!-- logo -->
                <a href="index-2.html" class="navbar-brand">
                    <img src="jsp/img/logo.png" alt="travly">
                    
                </a>
                <!-- /logo -->
            </div>

            <ul class="nav navbar-nav">
                <li class="hidden-xs">
                    <!-- toggle small menu -->
                    <a href="javascript:;" class="toggle-sidebar">
                        <i class="ti-menu"></i>
                    </a>
                    <!-- /toggle small menu -->
                </li>
                <li class="header-search">
                    <!-- toggle search -->
                    <a href="javascript:;" class="toggle-search">
                        <i class="ti-search"></i>
                    </a>
                    <!-- /toggle search -->
                    <div class="search-container">
                        <form role="search">
                            <input type="text" class="form-control search" placeholder="type and press enter">
                        </form>
                    </div>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">

                <li class="dropdown hidden-xs">
                    <a href="javascript:;" data-toggle="dropdown">
                        <i class="ti-more-alt"></i>
                    </a>
                    <ul class="dropdown-menu animated zoomIn">
                        <li class="dropdown-header">Quick Links</li>
                        <li>
                            <a href="javascript:;">Start New Campaign</a>
                        </li>
                        <li>
                            <a href="javascript:;">Review Campaigns</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="javascript:;">Settings</a>
                        </li>
                        <li>
                            <a href="javascript:;">Wish List</a>
                        </li>
                        <li>
                            <a href="javascript:;">Purchases History</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="javascript:;">Activity Log</a>
                        </li>
                        <li>
                            <a href="javascript:;">Settings</a>
                        </li>
                        <li>
                            <a href="javascript:;">System Reports</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="javascript:;">Help</a>
                        </li>
                        <li>
                            <a href="javascript:;">Report a Problem</a>
                        </li>
                    </ul>
                </li>

                <li class="notifications dropdown">
                    <a href="javascript:;" data-toggle="dropdown">
                        <i class="ti-bell"></i>
                        <div class="badge badge-top bg-danger animated flash">
                            <span>3</span>
                        </div>
                    </a>
                    <div class="dropdown-menu animated fadeInLeft">
                        <div class="panel panel-default no-m">
                            <div class="panel-heading small"><b>Notifications</b>
                            </div>
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <a href="javascript:;">
                                        <span class="pull-left mt5 mr15">
                                            <img src="jsp/img/face4.jpg" class="avatar avatar-sm img-circle" alt="">
                                        </span>
                                        <div class="m-body">
                                            <div class="">
                                                <small><b>CRYSTAL BROWN</b></small>
                                                <span class="label label-danger pull-right">ASSIGN AGENT</span>
                                            </div>
                                            <span>Opened a support query</span>
                                            <span class="time small">2 mins ago</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="list-group-item">
                                    <a href="javascript:;">
                                        <div class="pull-left mt5 mr15">
                                            <div class="circle-icon bg-danger">
                                                <i class="ti-download"></i>
                                            </div>
                                        </div>
                                        <div class="m-body">
                                            <span>Upload Progress</span>
                                            <div class="progress progress-xs mt5 mb5">
                                                <div class="progress-bar" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                </div>
                                            </div>
                                            <span class="time small">Submited 23 mins ago</span>
                                        </div>
                                    </a>
                                </li>
                                <li class="list-group-item">
                                    <a href="javascript:;">
                                        <span class="pull-left mt5 mr15">
                                            <img src="jsp/img/face3.jpg" class="avatar avatar-sm img-circle" alt="">
                                        </span>
                                        <div class="m-body">
                                            <em>Status Update:</em>
                                            <span>All servers now online</span>
                                            <span class="time small">5 days ago</span>
                                        </div>
                                    </a>
                                </li>
                            </ul>

                            <div class="panel-footer">
                                <a href="javascript:;">See all notifications</a>
                            </div>
                        </div>
                    </div>
                </li>

                <li class="off-right">
                    <a href="javascript:;" data-toggle="dropdown">
                        <img src="jsp/img/avatar.jpg" class="header-avatar img-circle" alt="user" title="user">
                        <span class="hidden-xs ml10">${user.name}</span>
                        <i class="ti-angle-down ti-caret hidden-xs"></i>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight">
                        <li>
                            <a href="javascript:;">Settings</a>
                        </li>
                        <li>
                            <a href="javascript:;">Upgrade</a>
                        </li>
                        <li>
                            <a href="javascript:;">
                                <div class="badge bg-danger pull-right">3</div>
                                <span>Notifications</span>
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;">Help</a>
                        </li>
                        <li>
                            <a href="javascript:formSubmit()">Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </header>
        <!-- /top header -->

