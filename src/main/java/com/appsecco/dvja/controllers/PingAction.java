package com.appsecco.dvja.controllers;

import org.apache.commons.lang.StringUtils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class PingAction extends BaseController {

    private String address;
    private String commandOutput;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCommandOutput() {
        return commandOutput;
    }

    public void setCommandOutput(String commandOutput) {
        this.commandOutput = commandOutput;
    }

    public String execute() {
        if(StringUtils.isEmpty(getAddress()))
            return INPUT;

        try {
            doExecCommand();
        } catch (Exception e) {
            addActionMessage("Error running command: " + e.getMessage());
        }

        return SUCCESS;
    }

    private void doExecCommand() throws IOException {
        Runtime runtime = Runtime.getRuntime();
        String[] command = { "/bin/bash", "-c", "ping -t 5 -c 5 " + getAddress() };
        Process process = runtime.exec(command);

        BufferedReader  stdinputReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
        String line = null;
        String output = "Output:\n\n";

        while((line = stdinputReader.readLine()) != null)
            output += line + "\n";

        output += "\n";
        output += "Error:\n\n";

        stdinputReader = new BufferedReader(new InputStreamReader(process.getErrorStream()));
        while((line = stdinputReader.readLine()) != null)
            output += line + "\n";

        setCommandOutput(output);
    }
}
