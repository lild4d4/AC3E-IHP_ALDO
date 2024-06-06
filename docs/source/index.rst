Welcome to LDO_AC3E documentation!
===================================
**! Please note that this documentation is still a work in progress !**

Introduction
------------
Welcome to the documentation for the ihp_design project. This project includes design examples for IHP-Open-PDK technology, featuring various components like low dropout regulators, pass transistors, and amplifiers. Notably, this design was taped out as part of one of the first open-source tapeouts from IHP.

.. figure:: fig/LDO_AC3E_nofill.png
  :align: center

  TOP GDS

.. note::

   For information about the TOP layout distribution of the designs please refer to :ref:`TOP_design`.

This project includes:

1. A Low Dropout (LDO) Regulator in both closed and open loop configurations.
2. A Pass Transistor.
3. A Two-Stage Transconductance Amplifier.
4. Transmission Gates for testing.

Below is a brief description of the main components of this project:

Low Dropout Regulator (LDO)
----------------------------

The LDO is the primary design in this project, created to provide a stable output voltage of 1.2V at 100mA (:ref:`LDO_design`). This design is completely characterized through standalone :ref:`simulations <LDO_simulation>` and :ref:`Monte Carlo <LDO_monte_carlo>` simulations, with its main parameters verified using the :ref:`CACE <CACE_simulations>` tool.

The LDO is separated into Closed-Loop and Open-Loop configurations, each with its own layout in the TOP GDS.

Two-Stage Transconductance Amplifier
-------------------------------------

The 2-Stage Operational Transconductance Amplifier (OTA) is a submodule of the LDO, included as a separate design for measurement purposes. The simulations and parameter verification of the 2-stage OTA as a standalone component are currently a **work in progress**.

Pass Transistor
---------------

The Pass Transistor is a submodule of the LDO, included as a separate design for measurement purposes. The simulations and parameter verification of the pass transistor as a standalone component are currently a **work in progress**.



Transmission Gates
-------------------
**work in progress**.

Contents
--------

.. toctree::
   :caption: Design
   :maxdepth: 2
   
   TOP_design
   LDO_design
   OTA_design

.. toctree::   
   :caption: Simulations
   :maxdepth: 2

   CACE
   LDO_simulation
   LDO_monte_carlo
   
.. toctree::   
   :caption: Layout
   :maxdepth: 2
   
   LDO_layout
   OTA_layout
   Passtransistor_layout
   
.. toctree::   
   :caption: Chip Testing
   :maxdepth: 2
   
   LDO_testing
