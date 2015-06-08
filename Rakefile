desc "Preview Site"
task :serve do
	system "jekyll s -D"
end

task :preview => :serve

namespace :assets do
	desc "Precompile assets"
	task :precompile do
		system "bundle exec jekyll b"
	end
end

namespace :deploy do
	desc "Deploy to git"
	task :git do
		system "git push"
		system "git push heroku master"
	end

	desc "Deploy to S3"
	task :s3 => [:build] do
		system "octopress deploy"
	end
end

task :deploy => ["deploy:s3", "deploy:git"]
task :build => ["assets:precompile"]
task :default => ["assets:precompile"]

task :test => [:build] do
end
