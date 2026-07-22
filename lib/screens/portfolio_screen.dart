import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_pieces.dart';
import '../models/portfolio_piece.dart';
import '../theme/gallery_theme.dart';

// Controls the order sections appear in. Any size not in this list (e.g. a
// custom size) is still shown, just grouped after these in whatever order
// it's found.
const List<String> _sizeOrder = ['A1', 'A2', 'A3', 'A4'];

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  static const String whatsappNumber = '2349164200997';

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  final _messageController = TextEditingController();

  Uint8List? _referenceImageBytes;
  String? _referenceImageName;

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _pickReferenceImage() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (picked == null) return;
    final bytes = await picked.readAsBytes();
    setState(() {
      _referenceImageBytes = bytes;
      _referenceImageName = picked.name;
    });
  }

  void _removeReferenceImage() {
    setState(() {
      _referenceImageBytes = null;
      _referenceImageName = null;
    });
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    final imageLine = _referenceImageName != null
        ? '\nReference photo attached: $_referenceImageName (please attach it in this chat)'
        : '';

    final text = 'Hi, I would like to work with you.\n'
        'Name: ${_nameController.text}\n'
        'Contact: ${_contactController.text}\n'
        'Details: ${_messageController.text}$imageLine';

    final url = Uri.parse(
      'https://wa.me/$whatsappNumber?text=${Uri.encodeComponent(text)}',
    );
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  Map<String, List<PortfolioPiece>> _groupBySize() {
    final Map<String, List<PortfolioPiece>> groups = {};
    for (final piece in portfolioPieces) {
      groups.putIfAbsent(piece.size, () => []).add(piece);
    }
    return groups;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 1100 ? 4 : (width > 650 ? 3 : 2);

    final groups = _groupBySize();
    final orderedSizes = [
      ..._sizeOrder.where(groups.containsKey),
      ...groups.keys.where((s) => !_sizeOrder.contains(s)),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Work With Me')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Past commissioned portrait work, organized by print size. '
                  'If you would like a custom piece, fill out the form below.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 32),
                for (final size in orderedSizes) ...[
                  _sectionHeading(context, '$size Portraits'),
                  const SizedBox(height: 16),
                  _PortfolioGrid(
                    pieces: groups[size]!,
                    crossAxisCount: crossAxisCount,
                  ),
                  const SizedBox(height: 40),
                ],
                const Divider(),
                const SizedBox(height: 24),
                _sectionHeading(context, "Let's Work Together"),
                const SizedBox(height: 16),
                _InquiryForm(
                  formKey: _formKey,
                  nameController: _nameController,
                  contactController: _contactController,
                  messageController: _messageController,
                  onSubmit: _submit,
                  referenceImageBytes: _referenceImageBytes,
                  referenceImageName: _referenceImageName,
                  onPickImage: _pickReferenceImage,
                  onRemoveImage: _removeReferenceImage,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionHeading(BuildContext context, String title) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        color: GalleryColors.accent,
      ),
    );
  }
}

class _PortfolioGrid extends StatelessWidget {
  final List<PortfolioPiece> pieces;
  final int crossAxisCount;
  const _PortfolioGrid({required this.pieces, required this.crossAxisCount});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pieces.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final piece = pieces[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: GalleryColors.surface,
                  border: Border.all(color: GalleryColors.divider),
                ),
                child: piece.imageUrl.startsWith('http')
                    ? Image.network(piece.imageUrl, fit: BoxFit.cover)
                    : Image.asset(piece.imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 8),
            Text(piece.title, style: Theme.of(context).textTheme.bodyMedium),
          ],
        );
      },
    );
  }
}

class _InquiryForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController contactController;
  final TextEditingController messageController;
  final VoidCallback onSubmit;
  final Uint8List? referenceImageBytes;
  final String? referenceImageName;
  final VoidCallback onPickImage;
  final VoidCallback onRemoveImage;

  const _InquiryForm({
    required this.formKey,
    required this.nameController,
    required this.contactController,
    required this.messageController,
    required this.onSubmit,
    required this.referenceImageBytes,
    required this.referenceImageName,
    required this.onPickImage,
    required this.onRemoveImage,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Your Name'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: contactController,
              decoration: const InputDecoration(labelText: 'Phone / WhatsApp / Email'),
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: messageController,
              decoration: const InputDecoration(
                labelText: 'What kind of piece are you looking for?',
              ),
              maxLines: 4,
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Required' : null,
            ),
            const SizedBox(height: 16),
            const Text(
              'REFERENCE PHOTO (OPTIONAL)',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: GalleryColors.textSecondary,
              ),
            ),
            const SizedBox(height: 8),
            if (referenceImageBytes != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.memory(
                      referenceImageBytes!,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          referenceImageName ?? '',
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      TextButton(
                        onPressed: onRemoveImage,
                        child: const Text('Remove'),
                      ),
                    ],
                  ),
                ],
              )
            else
              OutlinedButton.icon(
                onPressed: onPickImage,
                icon: const Icon(Icons.upload_outlined, size: 18),
                label: const Text('Upload a reference photo'),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onSubmit,
              child: const Text('Submit & Continue on WhatsApp'),
            ),
          ],
        ),
      ),
    );
  }
}