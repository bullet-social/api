class ApiAuth

  def self.auth(key, secret)
		key = ApiKey.find_by(public: key)
		if key
			if key.secret == secret
				return { success: true }
			end
		end
		return { success: false }
	end
end
