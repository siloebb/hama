import 'package:flutter/material.dart';
import 'package:hama/src/core/domain/models/address.dart';
import 'package:hama/src/core/domain/models/home.dart';
import 'package:hama/src/core/system_design/widgets/primary_button.dart';
import 'package:hama/src/core/system_design/widgets/secondary_button.dart';

class HomeForm extends StatefulWidget {
  final void Function(String? id, String name, Address address) onSubmit;
  final Home? home;

  const HomeForm({super.key, required this.onSubmit, this.home});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  final _formKey = GlobalKey<FormState>();

  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _streetController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.home != null) {
      final home = widget.home!;
      _idController.text = home.id;
      _nameController.text = home.name;
      _streetController.text = home.address.street;
      _cityController.text = home.address.city;
      _stateController.text = home.address.state;
      _zipController.text = home.address.zip;
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _streetController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final address = Address(
        street: _streetController.text.trim(),
        city: _cityController.text.trim(),
        state: _stateController.text.trim(),
        zip: _zipController.text.trim(),
      );

      final id = _idController.text.trim();
      final name = _nameController.text.trim();

      widget.onSubmit(id, name, address);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            if (widget.home != null)
              _buildTextField(_idController, "ID", "ID is required"),
            _buildTextField(_nameController, "Name", "Name is required"),
            const SizedBox(height: 20),
            const Text(
              "Address",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            _buildTextField(_streetController, "Street", "Street is required"),
            _buildTextField(_cityController, "City", "City is required"),
            _buildTextField(_stateController, "State", "State is required"),
            _buildTextField(_zipController, "ZIP Code", "ZIP Code is required"),
            const SizedBox(height: 20),
            Row(
              children: [
                HAMSecondaryButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: 'Cancel',
                ),
                SizedBox(width: 20),
                HAMPrimaryButton(onPressed: _submitForm, label: "Save"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    String errorMsg,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator:
            (value) => value == null || value.trim().isEmpty ? errorMsg : null,
      ),
    );
  }
}
