require 'ruble'

bundle t(:bundle_name) do |bundle|
  bundle.author = 'Romke van der Meulen'
  bundle.contact_email_rot_13 = 'r.vd.meulen@iwink.nl'
  bundle.repository = "git@gitlab.services.kirra.nl:r.vd.meulen/php-extended-ruble.git"
  bundle.description = 'https://secure.iwink.nl/iwiki/index.php/PHP_Extended_Ruble'
  
  bundle.menu 'PHP Extended' do |main_menu|
    # main_menu.command t(:docs_for_word)
    # main_menu.separator
    # main_menu.menu t(:declarations) do |submenu|
  end
end
