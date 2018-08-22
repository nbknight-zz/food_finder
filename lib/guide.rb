require 'restaurant'
class Guide


	class Config
		@@actions = ['list', 'find', 'add', 'quit']
		def self.actions; @@actions; end

	end
	def initialize(path=nil)
		# locate the restaurant text file at path
		Restaurant.filepath = path
		if Restaurant.file_usable?
			puts "Found restaurant file."
		# or create a new file
		elsif Restaurant.create_file
			puts "Created restaurant file."
		# exit if create fails
		else
			puts "Exiting...\n\n"
			exit!
		end

	end

	def launch!
		introduction
		# action loop
		result = nil
		until result == :quit
			action = get_action
			result = do_action(action)
		end
		conclusion
	end

	def get_action
		action = nil
		# Keep asking for input until we get a valid action
		until Guide::Config.actions.include?(action)
			puts "Your only options are: " + Guide::Config.actions.join(", ") if action
			print "> "
			user_response = gets.chomp
			action = user_response.downcase.strip
		end
		return action
	end

	def do_action(action)
		case action
		when 'list'
			puts "Listing..."
		when 'find'
			puts "Finding..."
		when 'add'
			puts "Adding..."
		when 'quit'
			return :quit
		else
			puts "\nSorry, that wasn't and option\n"
		end
	end

	def introduction
		puts "\n\n<<< Welcome to the Food Finder >>>\n\n"
		puts "This is an interactive guide to find the food you crave.\n\n"			
	end

	def conclusion
		puts "\n<<< Adios and Dig In! >>>\n\n\n"
	end
end