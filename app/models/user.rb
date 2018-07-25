class User < ApplicationRecord
  has_many :user_assignments, dependent: :destroy

  has_many :fields, through: :user_assignments, source: :assignmentable, source_type: 'Field'
  has_many :projects, through: :user_assignments, source: :assignmentable, source_type: 'Project'
  has_many :issues, through: :user_assignments, source: :assignmentable, source_type: 'Issue'
  has_many :courses, through: :user_assignments, source: :assignmentable, source_type: 'Course'
  has_many :roles, through: :user_assignments

  has_many :user_answers
  has_many :topics, foreign_key: :author_id
  has_many :answers, foreign_key: :author_id  # Forum answers

  # validates :f_name, presence: true, length: { in: 1..20 }

  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    return "#{f_name} #{l_name}"
  end

  def self.region
    return {
      1	=> 'Республика Адыгея (Адыгея)',
      2 => 'Республика Башкортостан',
      3 => 'Республика Бурятия',
      4 => 'Республика Алтай',
      5 => 'Республика Дагестан',
      6 => 'Республика Ингушетия',
      7 => 'Кабардино-Балкарская Республика',
      8 => 'Республика Калмыкия',
      9 => 'Карачаево-Черкесская Республика',
      10 => 'Республика Карелия',
      11 => 'Республика Коми',
      12 => 'Республика Марий Эл',
      13 => 'Республика Мордовия',
      14 => 'Республика Саха (Якутия)',
      15 => 'Республика Северная Осетия - Алания',
      16 => 'Республика Татарстан (Татарстан)',
      17 => 'Республика Тыва',
      18 => 'Удмуртская Республика',
      19 => 'Республика Хакасия',
      20 =>	'Чеченская Республика',
      21 => 'Чувашская Республика - Чувашия',
      22 =>	'Алтайский край',
      23 =>	'Краснодарский край',
      24 =>	'Красноярский край',
      25 =>	'Приморский край',
      26 =>	'Ставропольский край',
      27 =>	'Хабаровский край',
      28 =>	'Амурская область',
      29 => 'Архангельская область',
      30 => 'Астраханская область',
      31 =>	'Белгородская область',
      32 =>	'Брянская область',
      33 =>	'Владимирская область',
      34 =>	'Волгоградская область',
      35 =>	'Вологодская область',
      36 =>	'Воронежская область',
      37 =>	'Ивановская область',
      38 =>	'Иркутская область',
      39 =>	'Калининградская область',
      40 =>	'Калужская область',
      41 =>	'Камчатский край',
      42 =>	'Кемеровская область',
      43 =>	'Кировская область',
      44 =>	'Костромская область',
      45 =>	'Курганская область',
      46 =>	'Курская область',
      47 =>	'Ленинградская область',
      48 =>	'Липецкая область',
      49 =>	'Магаданская область',
      50 =>	'Московская область',
      51 =>	'Мурманская область',
      52 =>	'Нижегородская область',
      53 =>	'Новгородская область',
      54 =>	'Новосибирская область',
      55 =>	'Омская область',
      56 =>	'Оренбургская область',
      57 =>	'Орловская область',
      58 =>	'Пензенская область',
      59 =>	'Пермский край',
      60 =>	'Псковская область',
      61 =>	'Ростовская область',
      62 =>	'Рязанская область',
      63 =>	'Самарская область',
      64 =>	'Саратовская область',
      65 =>	'Сахалинская область',
      66 =>	'Свердловская область',
      67 =>	'Смоленская область',
      68 =>	'Тамбовская область',
      69 =>	'Тверская область',
      70 =>	'Томская область',
      71 =>	'Тульская область',
      72 =>	'Тюменская область',
      73 =>	'Ульяновская область',
      74 =>	'Челябинская область',
      75 =>	'Забайкальский край',
      76 =>	'Ярославская область',
      77 =>	'г. Москва',
      78 =>	'Санкт-Петербург',
      79 =>	'Еврейская автономная область',
      83 =>	'Ненецкий автономный округ',
      86 =>	'Ханты-Мансийский автономный округ - Югра',
      87 =>	'Чукотский автономный округ',
      89 =>	'Ямало-Ненецкий автономный округ',
      91 =>	'Республика Крым',
      92 =>	'Севастополь',
      99 =>	'Иные территории, включая город и космодром Байконур'
    }
  end

  validates :region, inclusion: { in: [*1..(User.region.length)],
    message: 'Выбранный регион не найден' }

  validates :city, presence: true

  validates :birth_date, presence: true

end
