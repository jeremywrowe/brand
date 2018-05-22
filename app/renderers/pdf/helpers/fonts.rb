module Pdf
  module Helpers
    module Fonts
      def setup_fonts
        base_dir = Rails.root.join('vendor', 'assets', 'fonts')
        font_families.update(
          'Fa' => {
            normal: File.join(base_dir, 'fa-regular.ttf')
          },
          'FaBrands' => {
            normal: File.join(base_dir, 'fa-brands.ttf')
          },
          'OpenSans' => {
            normal: File.join(base_dir, 'OpenSans-Regular.ttf'),
            bold: File.join(base_dir, 'OpenSans-Bold.ttf')
          }
        )
      end
    end
  end
end