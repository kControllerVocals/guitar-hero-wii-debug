
script ui_create_net_serverlist 
	create_online_server_list <...>
	open_dwc_matchmaking_dialog
endscript

script ui_destroy_net_serverlist 
	destroy_generic_popup
	destroy_online_server_list
endscript
