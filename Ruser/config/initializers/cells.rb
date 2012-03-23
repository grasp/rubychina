# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'pathname'
pn = Pathname.new(File.dirname(__FILE__))
cell_path=pn.parent.parent
Cell::Base.view_paths=[
File.join(cell_path, 'app' ,'cells'),
File.join(cell_path, 'app' ,'cells', 'users')
]

