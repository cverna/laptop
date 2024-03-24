FROM quay.io/fedora-ostree-desktops/silverblue:39

# Keep container image for ~2 months
LABEL quay.expires-after=8w

RUN curl -o https://copr.fedorainfracloud.org/coprs/zetorian/v4l2loopback/repo/fedora-40/zetorian-v4l2loopback-fedora-40.repo /etc/yum.repos.d/zetorian-v4l2loopback-fedora-40.repo

RUN rpm-ostree install \
        htop \
        iwd \
        libvirt-daemon \
        libvirt-client \
        libvirt-daemon-log\
        libvirt-daemon-config-network \
        libvirt-daemon-driver-interface \
        libvirt-daemon-driver-network \
        libvirt-daemon-driver-nwfilter \
        libvirt-daemon-driver-qemu \
        libvirt-daemon-driver-secret \
        libvirt-daemon-driver-storage-core \
        libvirt-dbus \
        qemu-img \
        qemu-kvm \
        qemu-system-x86-core\
        sysprof \
        neovim \
	ffmpeg-free \
	gnome-tweaks \
	gstreamer1-plugin-openh264 \
	krb5-workstation \
	simple-scan \
	virt-manager \
	crun \
        genisoimage \
        coreutils \
        libselinux \
        shadow-utils \
        util-linux \
        virtiofsd \
        virt-install \
	libcamera-v4l2 \
	pipewire-v4l2 \
        v4l-utils \
	v4l2loopback \
    && \
    systemctl enable libvirtd.socket && \
    rm -rf /var/lib/unbound/root.key && \
    ostree container commit
