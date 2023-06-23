class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ['Fiction', 'Non-Fiction']}

    validate :title_sufficiency

    private
    def title_sufficiency
        if !title&.match?(/Won't Believe|Secret|Top\d|Guess/)
            errors.add(:title, 'Should consist of either "Won\'t Believe", "Secret", "Top [number]" or "Guess"' )
        end
    end
end
