namespace $rootnamespace$.Events
{
    using System;

    using EventStore;
    using EventStore.Dispatcher;

	using StealFocus.EventStoreExtensions;

    public class EventStoreFactory : IEventStoreFactory
    {
        [CLSCompliant(false)]
        public IStoreEvents Create(string connectionStringKey, IDispatchCommits dispatchCommits)
        {
            return Wireup.Init()
               .LogToOutputWindow()
               .UsingSqlPersistence(connectionStringKey)
                   .InitializeStorageEngine()
                   .UsingJsonSerialization()
                   .UsingSynchronousDispatchScheduler()
                   .DispatchTo(dispatchCommits)
               .Build();
        }
    }
}
