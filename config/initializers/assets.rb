Rails.application.config.assets.precompile << Proc.new do |path|
	if path =~ /\.(css|js|ico|png|jpg)\z/
		full_path = Rails.application.assets.resolve(path).to_path
		app_assets_path = Rails.root.join('app', 'assets').to_path
		if full_path.starts_with? app_assets_path
			puts "including asset: " + full_path
			true
		else
			puts "excluding asset: " + full_path
			false
		end
	else
		false
	end
end
#
## application client couples
#Rails.application.config.assets.precompile += %w( rooms.js )
#Rails.application.config.assets.precompile += %w( rooms.css )
#
## css plugins
#Rails.application.config.assets.precompile += %w( tablecloth.css )
#Rails.application.config.assets.precompile += %w( prettify.css )
#
## js plugins
#Rails.application.config.assets.precompile += %w( jquery.metadata.js )
#Rails.application.config.assets.precompile += %w( jquery.tablesorter.js )
#Rails.application.config.assets.precompile += %w( jquery.tablecloth.js )
#Rails.application.config.assets.precompile += %w( html5shiv-printshiv.js )
#Rails.application.config.assets.precompile += %w( html5shiv.js )
#Rails.application.config.assets.precompile += %w( respond.min.js )
