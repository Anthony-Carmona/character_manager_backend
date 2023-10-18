module API
    module V1
      class Characters < Grape::API
        include API::V1::Defaults
        resource :characters do
        desc "Return all users"
            get "" do
                Character.all
            end
        desc "Return a user"
            params do
                requires :id, type: String, desc: "ID of the user"
            end
            get ":id" do
                Character.find(params[:id])
            end
        end

        desc "creates a character"
            params do
                optional :name, type: String, desc: "name of the character"
                optional :proficiency_bonus, type: Integer, desc: "proficiency_bonus"
                optional :alignment, type: Integer, desc: "alignment"
                optional :experience, type: Integer, desc: "experience total"
                optional :inspiration, type: Integer, desc: "total inspiration"
                optional :strength, type: Integer, desc: "strength"
                optional :dexterity, type: Integer, desc: "dexterity"
                optional :constitution, type: Integer, desc: "consitution"
                optional :intelligence, type: Integer, desc: "intelligence"
                optional :wisdom, type: Integer, desc: "wisdom"
                optional :charisma, type: Integer, desc: "charisma"
            end
            post "" do
                Character.create!(params.slice(
                    *[:name,
                        :proficiency_bonus,
                        :alignment,
                        :experience,
                        :inspiration,
                        :strength,
                        :dexterity,
                        :constitution,
                        :intelligence,
                        :wisdom,
                        :charisma]
                ))
            end
        end
      end
    end
  end