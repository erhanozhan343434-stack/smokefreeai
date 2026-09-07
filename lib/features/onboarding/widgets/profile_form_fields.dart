import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:smokefree/core/l10n/generated/app_localizations.dart';
import 'package:smokefree/core/theme/app_colors.dart';
import 'package:smokefree/core/widgets/glass_card.dart';
import 'package:smokefree/domain/models/product_type.dart';

/// Onboarding ve Ayarlar ekranlarının paylaştığı profil formu alanları.
///
/// İkisi de aynı [ProductType] / miktar / fiyat / bırakma anı bilgisini
/// toplar — tek fark onboarding'in boş, Ayarlar'ın dolu başlamasıdır.
/// Görsel/davranışsal tutarlılık için tek yerde tanımlanır.
class SectionCard extends StatelessWidget {
  const SectionCard({required this.title, required this.child, super.key});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: t.labelSmall),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class ProductTypeGrid extends StatelessWidget {
  const ProductTypeGrid({
    required this.selected,
    required this.onSelected,
    super.key,
  });

  final ProductType? selected;
  final ValueChanged<ProductType> onSelected;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: 2.7,
      children: [
        for (final p in ProductType.values)
          ProductTypeTile(
            type: p,
            selected: p == selected,
            onTap: () => onSelected(p),
          ),
      ],
    );
  }
}

class ProductTypeTile extends StatelessWidget {
  const ProductTypeTile({
    required this.type,
    required this.selected,
    required this.onTap,
    super.key,
  });

  final ProductType type;
  final bool selected;
  final VoidCallback onTap;

  static const _icons = <ProductType, String>{
    ProductType.cigarette: '🚬',
    ProductType.rollYourOwn: '🌾',
    ProductType.vape: '💨',
    ProductType.hookah: '🔥',
    ProductType.cigar: '🚬',
    ProductType.snus: '📦',
  };

  static String _label(L10n l10n, ProductType type) => switch (type) {
        ProductType.cigarette => l10n.productCigarette,
        ProductType.rollYourOwn => l10n.productRollYourOwn,
        ProductType.vape => l10n.productVape,
        ProductType.hookah => l10n.productHookah,
        ProductType.cigar => l10n.productCigar,
        ProductType.snus => l10n.productSnus,
      };

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: selected
              ? AppColors.accent.withValues(alpha: 0.12)
              : Colors.white.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? AppColors.accent : AppColors.line,
          ),
        ),
        child: Row(
          children: [
            Text(_icons[type] ?? '❓', style: const TextStyle(fontSize: 18)),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                _label(l10n, type),
                style: t.bodySmall?.copyWith(
                  color: selected ? AppColors.ink : AppColors.ink2,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NumberField extends StatelessWidget {
  const NumberField({
    required this.controller,
    required this.label,
    this.allowDecimal = false,
    super.key,
  });

  final TextEditingController controller;
  final String label;
  final bool allowDecimal;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.numberWithOptions(decimal: allowDecimal),
      inputFormatters: [
        if (allowDecimal)
          FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]'))
        else
          FilteringTextInputFormatter.digitsOnly,
      ],
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.ink,
          ),
      decoration: InputDecoration(
        labelText: label,
        isDense: true,
        filled: true,
        fillColor: AppColors.surface2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.line),
        ),
      ),
    );
  }
}

class CurrencyDropdown extends StatelessWidget {
  const CurrencyDropdown({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final String value;
  final ValueChanged<String> onChanged;

  static const _currencies = ['TRY', 'USD', 'EUR', 'GBP'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      // ignore: deprecated_member_use
      value: value,
      isDense: true,
      dropdownColor: AppColors.surface2,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.ink,
          ),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: AppColors.surface2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.line),
        ),
      ),
      items: [
        for (final c in _currencies) DropdownMenuItem(value: c, child: Text(c)),
      ],
      onChanged: (v) {
        if (v != null) onChanged(v);
      },
    );
  }
}
bool _isSameDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;
class QuitDatePicker extends StatelessWidget {
  const QuitDatePicker({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final DateTime value;
  final ValueChanged<DateTime> onChanged;

  Future<void> _pickCustom(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: value,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (date == null || !context.mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(value),
    );
    if (time == null) return;

    onChanged(
      DateTime(date.year, date.month, date.day, time.hour, time.minute),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).textTheme;
    final l10n = L10n.of(context);
    final formatted = formatQuitDateTime(value);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            QuickChip(
              label: l10n.dateNow,
              selected: _isSameDay(value, DateTime.now()),
              onTap: () => onChanged(DateTime.now()),
            ),
            QuickChip(
              label: l10n.dateYesterday,
              selected: _isSameDay(
                value,
                DateTime.now().subtract(const Duration(days: 1)),
              ),
              onTap: () => onChanged(
                DateTime.now().subtract(const Duration(days: 1)),
              ),
            ),
            QuickChip(
              label: l10n.dateWeekAgo,
              selected: _isSameDay(
                value,
                DateTime.now().subtract(const Duration(days: 7)),
              ),
              onTap: () => onChanged(
                DateTime.now().subtract(const Duration(days: 7)),
              ),
            ),
            QuickChip(
              label: l10n.dateMonthAgo,
              selected: _isSameDay(
                value,
                DateTime.now().subtract(const Duration(days: 30)),
              ),
              onTap: () => onChanged(
                DateTime.now().subtract(const Duration(days: 30)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => _pickCustom(context),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.surface2,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.line),
            ),
            child: Row(
              children: [
                const Icon(Icons.event, color: AppColors.ink2, size: 18),
                const SizedBox(width: 10),
                Expanded(child: Text(formatted, style: t.bodyMedium)),
                Icon(
                  Directionality.of(context) == TextDirection.rtl
                      ? Icons.chevron_left
                      : Icons.chevron_right,
                  color: AppColors.ink3,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class QuickChip extends StatelessWidget {
  const QuickChip({
    required this.label,
    required this.onTap,
    this.selected = false,
    super.key,
  });

  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final accent = Theme.of(context).colorScheme.primary;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: selected
              ? accent.withValues(alpha: 0.15)
              : Colors.white.withValues(alpha: 0.03),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? accent : AppColors.line,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: selected ? accent : AppColors.ink2,
            fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

/// Sayısal, dile bağımsız tarih/saat biçimi ("gg.aa.yyyy, ss:dd").
///
/// `intl`'in yerelleştirilmiş ay adları için önce `initializeDateFormatting`
/// çağrılmasını istemesinden kaçınmak amacıyla — ve 11 dilin hepsinde ay
/// adı çevirisi tutmamak için — bilinçli olarak tamamen sayısal bir biçim
/// kullanılır. Bu biçim hangi dilde olursa olsun okunur ve belirsizliksizdir.
String formatQuitDateTime(DateTime d) {
  final dd = d.day.toString().padLeft(2, '0');
  final mm = d.month.toString().padLeft(2, '0');
  final hh = d.hour.toString().padLeft(2, '0');
  final mi = d.minute.toString().padLeft(2, '0');
  return '$dd.$mm.${d.year}, $hh:$mi';
}
