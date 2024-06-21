class TableComponent < ViewComponent::Base
 renders_one :header, TableHeaderComponent
 renders_many :rows, TableRowComponent
end
