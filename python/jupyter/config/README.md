### Main

- https://jupyter.org/install
- version 3.0 doesn't work yet with extensions
- `pip install jupyterlab==v3.0.0rc6` # look at recent tag https://github.com/jupyterlab/jupyterlab
- `pip install jupyterlab==2.2.8`
- config directories
  - `~/.ipython`
  - `~/.jupyter`
- `jupyter lab --generate-config`
- `jupyter --path` to see the config, data and runtime paths

### Extensions

- `jupyter labextension list`
- `jupyter serverextension list`

### Installs

Dracula

```
jupyter labextension install @karosc/jupyterlab_dracula
Settings -> JupyterLab Theme -> Dracula
```

Variable Inspector

```
jupyter labextension install @lckr/jupyterlab_variableinspector
```

LSP

```
pip install jupyter-lsp
jupyter labextension install @krassowski/jupyterlab-lsp
pip install python-language-server[all]
```

Templates

```
pip install jupyterlab_templates
jupyter labextension install jupyterlab_templates
jupyter serverextension enable --py jupyterlab_templates

vi /home/chyld/.jupyter/jupyter_notebook_config.py

c.JupyterLabTemplates.template_dirs = ['/home/chyld/Code/devops/python/jupyter/templates']
c.JupyterLabTemplates.include_default = False
c.JupyterLabTemplates.include_core_paths = False
```

Execute Time

```
jupyter labextension install jupyterlab-execute-time

Settings -> Advanced Settings Editor -> Notebook -> 

{
    "recordTiming": true
}

```

Collapsible Headings

```
jupyter labextension install @aquirdturtle/collapsible_headings
```

Python File

```
jupyter labextension install jupyterlab-python-file
```

Black Formatter

```
pip install black nb_black

%load_ext lab_black
```

### Alternate Starter Code

To have code auto loaded into a Jupyter Environment, add files to the following directory.

```
/home/chyld/.ipython/profile_default/startup/
01-start.py
02.go.ipy
03.now.py
```
