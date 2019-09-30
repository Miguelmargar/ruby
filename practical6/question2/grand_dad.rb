class Grand_dad
    attr_accessor :gender, :job, :nationality, :status
    
    def initialize
        @gender = "male"
        @job = false
        @nationality = "Irish"
        @status = "married"
    end
    
    def talks_status
        p "Hello I'm the grand dad and I'm #{status}"
    end
    
    def talks_nationality
        p "Hello, I'm #{nationality}"
    end
    
    def talks_job
        if @job
            p "Hello, I'm employed"
        else
            p "Hello I'm not employed at the moment"
        end
    end
    
end