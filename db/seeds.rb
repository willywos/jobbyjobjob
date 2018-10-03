# Clean Up
DatabaseCleaner.clean_with :truncation
puts 'Truncated Dev Database...'

# Create Test User
test_user = User.create!(email: 'user@test.com', password: 'password')
puts 'Test User Created!'

# Seed Jobs
Rake::Task['jobby_job:process_job_sites'].execute

# User / Job Association
SavedJob.create!(user_id: test_user.id, job_posting_id: JobPosting.first.id)

puts 'Seeded Successfully!'
