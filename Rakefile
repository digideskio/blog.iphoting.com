namespace :assets do
		desc "Precompile assets"
		task :precompile do
				system "bundle exec jekyll b"
		end
end

desc "Deploy site"
task :deploy do
		system "octopress deploy"
end

task :build => ["assets:precompile"]
task :default => ["assets:precompile"]

