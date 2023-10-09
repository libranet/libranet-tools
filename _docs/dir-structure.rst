Overview directory structure
============================
.. _dir-structure:

After git-cloning the tools-repository, we have 
the following file-and directory-structure.

.. note::

  Not *all* files and directories are listed. Only the
  ones that are of interest to us.


.. code-block:: sh

  /opt/tools/    (=our tools-directory)
      bin/

      _docs/  (sphinx-based documentation)
          conf.py
          index.rst
          ...
          var/docs/html/index.html

      .gitignore

      <toolname>/
          makefile
