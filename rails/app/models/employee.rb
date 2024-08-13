class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # confirmable, lockable, timeoutable, trackable, omniauthable and registerable
  devise(
    :database_authenticatable,
    :recoverable,
    :rememberable,
    :validatable
  )

  def full_name
    "#{first_name} #{last_name}".strip if self.first_name
  end

  validates :email, presence: true
  validates :first_name, presence: true, length: {minimum: 2, maximum: 50}
  validates :last_name, presence: true, length: {minimum: 2, maximum: 50}
  # validates :title, presence: true, length: { minimum: 2, maximum: 50 }
  # validates :title_of_courtesy, presence: true, length: { minimum: 2, maximum: 50 }
  # validates :birth_date, presence: true, date: { after: 18.years.ago, before: 65.years.ago }
  # validates :hire_date, presence: true, date: { after: 1.month.ago }
  # validates :home_phone, presence: true, length: { minimum: 2, maximum: 25 }
  # validates :extension, presence: true, length: { minimum: 2, maximum: 3 }

  scope :first_name_like, -> (query) { where("first_name LIKE ?", "%#{query}%") }
  scope :last_name_like, -> (query) { where("last_name LIKE ?", "%#{query}%") }
  scope :first_name_or_last_name_like, -> (query) { first_name_like(query).or(last_name_like(query)) }

  def self.name_like(q)

    words = q.split

    if words.length > 1
      employees = first_name_like(words[0]) + last_name_like(words[1])
    else
      employees = first_name_or_last_name_like(q)
    end

    employees.uniq
  end

  has_and_belongs_to_many :addresses, inverse_of: :employees
  has_many :subordinates, class_name: "Employee", foreign_key: "reports_to"
  belongs_to :manager, class_name: "Employee", foreign_key: "reports_to", optional: true
  belongs_to :region
  has_many :orders
end
