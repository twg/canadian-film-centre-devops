if ['app_master', 'app', 'solo'].include?(node[:instance_role])
	node[:applications].each do |app, data|
		remote_file "/data/nginx/servers/#{app}/custom.conf" do
			source "custom.conf"
		end
	end

	execute "Reload nginx config" do
		command "sudo /etc/init.d/nginx reload"
	end
end