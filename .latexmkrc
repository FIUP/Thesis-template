# Taken from http://mirrors.ctan.org/support/latexmk/example_rcfiles/glossaries_latexmkrc

add_cus_dep( 'acn', 'acr', 0, 'makeglossaries' );
add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );
add_cus_dep( 'svg', 'pdf', 0, 'svg2pdf' );
add_cus_dep( 'drawio.svg', 'pdf', 0, 'drawio2pdf');

$clean_ext .= " acr acn alg glo gls glg bbl ist";

sub makeglossaries {
    my ($base_name, $path) = fileparse( $_[0] );
    my @args = ( "-q", "-d", $path, $base_name );
    if ($silent) { unshift @args, "-q"; }
    return system "makeglossaries", "-d", $path, $base_name;
}

sub svg2pdf {
   system("cairosvg -o $_[0].pdf $_[0].svg ");
}

sub drawio2pdf {
   system("sed 's/<text text-anchor=\"middle\" font-size=\"10px\" x=\"50%\" y=\"100%\">Viewer does not support full SVG 1.1<\\/text>//g' $_[0].drawio.svg | cairosvg -o $_[0].pdf -");
}

# Compile a PDF
$pdf_mode = 1;

# Put auxiliary files in build directory
$aux_dir = 'build';

# Use the latexmk -cd option by default
$do_cd = 1;

# Don't prompt for user interaction on errors and use synctex
$pdflatex = 'pdflatex --interaction=nonstopmode --synctex=1 --shell-escape %O %S';
