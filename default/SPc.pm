package SPc;

=head1 NAME

SPc - build-time system path configuration

=cut

use warnings;
use strict;

our $VERSION = '0.07';

use File::Spec;

sub _path_types {qw(
	prefix
	localstatedir
	sysconfdir
	datadir
	docdir
	cache
	log
	spool
	run
	lock
	state
	localedir
)};

=head1 PATHS

=head2 prefix

=head2 localstatedir

=head2 sysconfdir

=head2 datadir

=head2 docdir

=head2 cache

=head2 log

=head2 spool

=head2 run

=head2 lock

=head2 state

=cut

# sub names inspired by http://www.gnu.org/software/autoconf/manual/html_node/Installation-Directory-Variables.html#Installation-Directory-Variables
use Config;                                                  # remove after install
my $prefix = $Config::Config{'prefix'};                      # remove after install
my $localstatedir =                                          # remove after install
	$Config::Config{'prefix'} eq '/usr'                      # remove after install
	? '/var'                                                 # remove after install
	: File::Spec->catdir($Config::Config{'prefix'}, 'var')   # remove after install
;                                                            # remove after install
my $sysconfdir =                                             # remove after install
	$Config::Config{'prefix'} eq '/usr'                      # remove after install
	? '/etc'                                                 # remove after install
	: File::Spec->catdir($Config::Config{'prefix'}, 'etc')   # remove after install
;                                                            # remove after install

sub prefix        { shift; $prefix = $_[0] if @_; return $prefix; };
sub localstatedir { shift; $localstatedir = $_[0] if @_; return $localstatedir; };

sub sysconfdir { shift; $sysconfdir = $_[0] if @_; return $sysconfdir; };
sub datadir    { File::Spec->catdir(__PACKAGE__->prefix, 'share') };
sub docdir     { File::Spec->catdir(__PACKAGE__->prefix, 'share', 'doc') };
sub localedir  { File::Spec->catdir(__PACKAGE__->prefix, 'share', 'locale') };
sub cache      { File::Spec->catdir(__PACKAGE__->localstatedir, 'cache') };
sub log        { File::Spec->catdir(__PACKAGE__->localstatedir, 'log') };
sub spool      { File::Spec->catdir(__PACKAGE__->localstatedir, 'spool') };
sub run        { File::Spec->catdir(__PACKAGE__->localstatedir, 'run') };
sub lock       { File::Spec->catdir(__PACKAGE__->localstatedir, 'lock') };
sub state      { File::Spec->catdir(__PACKAGE__->localstatedir, 'state') };

1;


__END__

=head1 AUTHOR

Jozef Kutej

=cut
