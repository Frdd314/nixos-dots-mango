{ config, pkgs, ... }:

{
    programs.bash = {
	  enable = true;
	  shellAliases = {
	      btw = "echo i use bullshitOS btw";
		  nixrebuild = "sudo nixos-rebuild switch";
		  nixrebuildF = "sudo nixos-rebuild switch --flake /etc/nixos#nixos-btw"; 
          nixgarbage = "sudo nix-collect-garbage";
          nixoldgen = "sudo nix-collect-garbage -d";
          nixoptimise = "sudo nix-store --optimise";
		  nixconf = "vim /etc/nixos/configuration.nix";
	      nixhome = "vim /etc/nixos/home.nix";
    	  nixflake = "vim /etc/nixos/home.nix";
      };
    };
}
