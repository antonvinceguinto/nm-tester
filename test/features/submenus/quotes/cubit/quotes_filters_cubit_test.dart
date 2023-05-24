import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nextminute/features/menu/sub_menus/quotes/cubit/quotes_filters_cubit.dart';

import '../../jobs/sub_menus/job_details/view/simple_map_page_test.dart';

void main() {
  group('QuotesFiltersCubit', () {
    late QuotesFiltersCubit quotesFiltersCubit;

    setUp(() {
      quotesFiltersCubit = QuotesFiltersCubit();
    });

    tearDown(() {
      quotesFiltersCubit.close();
    });

    test('initial state is QuotesFiltersState', () {
      expect(quotesFiltersCubit.state, const QuotesFiltersState());
    });

    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'clearFilters sets state to initial state',
      build: () => quotesFiltersCubit,
      act: (cubit) => cubit.clearFilters(),
      expect: () => [const QuotesFiltersState()],
    );

    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with updated customDateRange when saveCustomDateRange '
      'is called. isStart is true',
      build: () => quotesFiltersCubit,
      act: (cubit) => cubit.saveCustomDateRange(
        selectedDate: DateTime(2022),
        isStart: true,
      ),
      expect: () => [
        QuotesFiltersState(
          customDateRange: {
            'start': DateTime(2022),
            'end': null,
          },
        ),
        QuotesFiltersState(
          customDateRange: {
            'start': DateTime(2022),
            'end': null,
          },
          tempSelectedCustomDate: 'Date Range',
          tempCustomDateFilters: const {
            'UpdateDateFrom': '2022-01-01',
            'CustomDateOn': 'Date Range',
          },
        ),
      ],
    );

    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with updated customDateRange when saveCustomDateRange '
      'is called. isStart is false',
      build: () => quotesFiltersCubit,
      act: (cubit) => cubit.saveCustomDateRange(
        selectedDate: DateTime(2022),
        isStart: false,
      ),
      expect: () => [
        QuotesFiltersState(
          customDateRange: {
            'start': null,
            'end': DateTime(2022),
          },
        ),
        QuotesFiltersState(
          customDateRange: {
            'start': null,
            'end': DateTime(2022),
          },
          tempSelectedCustomDate: 'Date Range',
          tempCustomDateFilters: const {
            'UpdateDateTo': '2022-01-01',
            'CustomDateOn': 'Date Range',
          },
        ),
      ],
    );

    // Testing toggleJobFilter
    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with toggled isJobFilterEnabled when '
      'toggleJobFilter is called',
      build: () => quotesFiltersCubit,
      act: (cubit) => cubit.toggleJobFilter(),
      expect: () => [
        const QuotesFiltersState(isJobFilterEnabled: true),
      ],
    );

    // Testing applyJobFilterFromSelectPage
    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with updated selectedJobs and selectedEnabledJobs when '
      'applyJobFilterFromSelectPage is called',
      build: () => quotesFiltersCubit,
      seed: () => QuotesFiltersState(
        tempSelectedJobsFromJobsPage: [MockJobInfoLevelModel()],
      ),
      act: (cubit) => cubit.applyJobFilterFromSelectPage(),
      verify: (qfc) {
        expect(qfc.state.selectedJobs.length, 1);
        expect(qfc.state.selectedJobs[0], isA<MockJobInfoLevelModel>());
        expect(qfc.state.selectedEnabledJobs.length, 1);
        expect(qfc.state.selectedEnabledJobs[0], isA<MockJobInfoLevelModel>());
        expect(qfc.state.tempSelectedJobsFromJobsPage.length, 1);
        expect(
          qfc.state.tempSelectedJobsFromJobsPage[0],
          isA<MockJobInfoLevelModel>(),
        );
      },
    );

    // Testing selectAllJobsFromJobsPage
    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with updated tempSelectedJobsFromJobsPage when '
      'selectAllJobsFromJobsPage is called',
      build: () => quotesFiltersCubit,
      act: (cubit) =>
          cubit.selectAllJobsFromJobsPage([MockJobInfoLevelModel()]),
      verify: (qfc) {
        expect(qfc.state.tempSelectedJobsFromJobsPage.length, 1);
        expect(
          qfc.state.tempSelectedJobsFromJobsPage[0],
          isA<MockJobInfoLevelModel>(),
        );
      },
    );

    // Testing selectNonFromJobsPage
    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with empty tempSelectedJobsFromJobsPage when '
      'selectNonFromJobsPage is called',
      build: () => quotesFiltersCubit,
      act: (cubit) => cubit.selectNonFromJobsPage(),
      expect: () => [
        const QuotesFiltersState(),
      ],
    );

    // Testing addTempSelectedJobsFromJobsPage
    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with updated tempSelectedJobsFromJobsPage when '
      'addTempSelectedJobsFromJobsPage is called',
      build: () => quotesFiltersCubit,
      act: (cubit) =>
          cubit.addTempSelectedJobsFromJobsPage(MockJobInfoLevelModel()),
      verify: (qfc) {
        expect(qfc.state.tempSelectedJobsFromJobsPage.length, 1);
        expect(
          qfc.state.tempSelectedJobsFromJobsPage[0],
          isA<MockJobInfoLevelModel>(),
        );
      },
    );

    // Testing clearSelectedJobs
    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with cleared selectedJobs, selectedEnabledJobs, '
      'and tempSelectedJobsFromJobsPage when clearSelectedJobs is called',
      build: () => quotesFiltersCubit,
      seed: () => QuotesFiltersState(
        selectedJobs: [MockJobInfoLevelModel()],
        selectedEnabledJobs: [MockJobInfoLevelModel()],
        tempSelectedJobsFromJobsPage: [MockJobInfoLevelModel()],
      ),
      act: (cubit) => cubit.clearSelectedJobs(),
      expect: () => [
        const QuotesFiltersState(),
      ],
    );

    // Testing toggleJobEnabled
    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with updated selectedEnabledJobs when '
      'toggleJobEnabled is called',
      build: () => quotesFiltersCubit,
      seed: () {
        final mockJobInfoLevelModel = MockJobInfoLevelModel();
        return QuotesFiltersState(selectedEnabledJobs: [mockJobInfoLevelModel]);
      },
      act: (cubit) {
        final currentState = cubit.state;
        final mockJobInfoLevelModel = currentState.selectedEnabledJobs.first;
        cubit.toggleJobEnabled(mockJobInfoLevelModel);
      },
      expect: () => [
        const QuotesFiltersState(),
      ],
    );

    // saveDateFilter test
    final startDate = DateTime(2023);
    final endDate = DateTime(2023).add(const Duration(days: 5));
    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with updated quoteDateRange when saveDateFilter is called',
      build: () => quotesFiltersCubit,
      act: (cubit) {
        cubit
          ..saveDateFilter(selectedDate: startDate, isStart: true)
          ..saveDateFilter(selectedDate: endDate, isStart: false);
      },
      expect: () => [
        QuotesFiltersState(
          quoteDateRange: {'start': startDate, 'end': null},
        ),
        QuotesFiltersState(
          quoteDateRange: {'start': startDate, 'end': null},
          tempSelectedQuoteDate: 'Date Range',
          tempQuoteDateFilters: const {
            'BillableDateFrom': '2023-01-01',
            'QuoteDateOn': 'Date Range',
          },
        ),
        QuotesFiltersState(
          quoteDateRange: {'start': startDate, 'end': endDate},
          tempSelectedQuoteDate: 'Date Range',
          tempQuoteDateFilters: const {
            'BillableDateFrom': '2023-01-01',
            'QuoteDateOn': 'Date Range',
          },
        ),
        QuotesFiltersState(
          quoteDateRange: {'start': startDate, 'end': endDate},
          tempSelectedQuoteDate: 'Date Range',
          tempQuoteDateFilters: const {
            'BillableDateFrom': '2023-01-01',
            'BillableDateTo': '2023-01-06',
            'QuoteDateOn': 'Date Range',
          },
        ),
      ],
    );

    // addQuoteDateFilter - Expired test
    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with updated tempQuoteDateFilters when '
      'addQuoteDateFilter is called with "Expired"',
      build: () => quotesFiltersCubit,
      act: (cubit) => cubit.addQuoteDateFilter('Expired'),
      expect: () => [
        isA<QuotesFiltersState>().having(
          (state) => state.tempQuoteDateFilters['QuoteDateOn'],
          'QuoteDateOn',
          'Expired',
        ),
      ],
    );

    // addFilter test
    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with updated filters when addFilter is called',
      build: () => quotesFiltersCubit,
      act: (cubit) => cubit.addFilter('testKey', 'testValue'),
      expect: () => [
        const QuotesFiltersState(filters: {'testKey': 'testValue'}),
      ],
    );

    // addTempFilter test
    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with updated tempFilters when addTempFilter is called',
      build: () => quotesFiltersCubit,
      act: (cubit) => cubit.addTempFilter('testKey', 'testValue'),
      expect: () => [
        const QuotesFiltersState(tempFilters: {'testKey': 'testValue'}),
      ],
    );

    // addTempFilter - remove test
    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with updated tempFilters when '
      'addTempFilter is called to remove an existing key',
      build: () => quotesFiltersCubit,
      seed: () =>
          const QuotesFiltersState(tempFilters: {'testKey': 'testValue'}),
      act: (cubit) => cubit.addTempFilter('testKey', 'testValue'),
      expect: () => [
        const QuotesFiltersState(),
      ],
    );

    // applyTempFilters test
    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with applied temporary filters when '
      'applyTempFilters is called',
      build: () => quotesFiltersCubit,
      seed: () => const QuotesFiltersState(
        tempFilters: {'filter1': 'value1'},
        tempQuoteDateFilters: {'BillableDateFrom': '2023-04-28'},
        tempCustomDateFilters: {
          'DueDateFrom': '2023-04-28',
          'CustomDateOn': 'Expired'
        },
      ),
      act: (cubit) {
        cubit.applyTempFilters([], [], []);
      },
      expect: () => [
        isA<QuotesFiltersState>()
            .having((state) => state.filters['filter1'], 'filter1', 'value1')
            .having(
              (state) => state.filters['BillableDateFrom'],
              'BillableDateFrom',
              '2023-04-28',
            )
            .having(
              (state) => state.filters['DueDateFrom'],
              'DueDateFrom',
              null,
            ),
      ],
    );

    // resetFilters test
    blocTest<QuotesFiltersCubit, QuotesFiltersState>(
      'emits state with reset temporary filters when resetFilters is called',
      build: () => quotesFiltersCubit,
      seed: () => const QuotesFiltersState(
        filters: {'filter1': 'value1', 'filter2': 'value2'},
        quoteDateFilters: {'BillableDateFrom': '2023-04-28'},
        selectedQuoteDate: 'Date Range',
      ),
      act: (cubit) {
        cubit.resetFilters();
      },
      expect: () => [
        isA<QuotesFiltersState>().having(
          (state) => state.tempFilters,
          'tempFilters',
          {'filter1': 'value1', 'filter2': 'value2'},
        ).having(
          (state) => state.tempQuoteDateFilters,
          'tempQuoteDateFilters',
          {'BillableDateFrom': '2023-04-28'},
        ).having(
          (state) => state.tempSelectedQuoteDate,
          'tempSelectedQuoteDate',
          'Date Range',
        ),
      ],
    );
  });
}
